/*
 * volumed - volume daemon for PiBoy DMG volume wheel input
 *
 * Copyright (C) 2021 - David Barbion <davidb@230ruedubac.fr>
 *
 * based on evtest.c,  Copyright (c) 1999-2000 Vojtech Pavlik
 *          amixer.c,  Copyright (c) 1999-2000 by Jaroslav Kysela
 *          volumed.c, Copyright (c) 2005 by Jochen Eisinger
 *          pavolume.c,  Copyright (c) 2017-2021 Biniam Bekele (Andornaut)
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or 
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 * 
 */

#include <linux/input.h>

#include <fcntl.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <syslog.h>
#include <unistd.h>

#include <pulse/pulseaudio.h>

#define BITS_PER_LONG (sizeof(long) * 8)
#define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
#define OFF(x)  ((x)%BITS_PER_LONG)
#define BIT(x)  (1UL<<OFF(x))
#define LONG(x) ((x)/BITS_PER_LONG)
#define test_bit(bit, array)  ((array[LONG(bit)] >> OFF(bit)) & 1)

static pa_mainloop *mainloop = NULL;
static pa_mainloop_api *mainloop_api = NULL;
static pa_context *context = NULL;
int retval = EXIT_SUCCESS;

static void wait_loop(pa_operation *op) {
    while (pa_operation_get_state(op) == PA_OPERATION_RUNNING) {
        if (pa_mainloop_iterate(mainloop, 1, &retval) < 0) {
            break;
        };
    }
    pa_operation_unref(op);
}

static pa_volume_t denormalize(int volume) {
    return (pa_volume_t) round(volume * PA_VOLUME_NORM / 100);
}

static int constrain_volume(int volume) {
    if (volume > 100) {
        return 100;
    }
    if (volume < 0) {
        return 0;
    }
    return volume;
}

static void set_volume(pa_context *c, pa_sink_info *i, __attribute__((unused)) int eol, int * volume) {
    if (i == NULL) {
        return;
    }

    pa_cvolume *cvolume = &i->volume;
    pa_cvolume *new_cvolume = pa_cvolume_set(cvolume, i->volume.channels, denormalize(constrain_volume(*volume)));
    pa_context_set_sink_volume_by_index(c, i->index, new_cvolume, NULL, NULL);
}

static int init_context(pa_context *c, int retval) {
    pa_context_connect(c, NULL, PA_CONTEXT_NOFLAGS, NULL);
    pa_context_state_t state;
    while (state = pa_context_get_state(c), true) {
        if (state == PA_CONTEXT_READY) {
            return 0;
        }
        if (state == PA_CONTEXT_FAILED) {
            return 1;
        }
        pa_mainloop_iterate(mainloop, 1, &retval);
    }
}

static void get_server_info(__attribute__((unused)) pa_context *c, const pa_server_info *i, void *userdata) {
    if (i == NULL) {
        return;
    }
    strncpy(userdata, i->default_sink_name, 255);
}

static int quit(int new_retval) {
    // Only set `retval` if it hasn't been changed elsewhere (such as by PulseAudio in `pa_mainloop_iterate()`).
    if (retval == EXIT_SUCCESS) {
        retval = new_retval;
    }
    if (context) {
        pa_context_unref(context);
    }
    if (mainloop_api) {
        mainloop_api->quit(mainloop_api, retval);
    }
    if (mainloop) {
        pa_signal_done();
        pa_mainloop_free(mainloop);
    }
    return retval;
}

int main (int argc, char **argv)
{
  int fd, rd, i;
  struct input_event ev[64];
  unsigned long bit[EV_MAX][NBITS(KEY_MAX)];
  int abs[5];
  long volume=50;
  char *default_sink_name[256];

  if (argc < 2) {
    printf("Usage: volumed /dev/input/eventX\n");
    printf("Where X = input device number\n");
    return 1;
  }

  if ((fd = open(argv[argc - 1], O_RDONLY)) < 0) {
    perror("volumed");
    return 1;
  }

  memset(bit, 0, sizeof(bit));
  ioctl(fd, EVIOCGBIT(0, EV_MAX), bit[0]);

  // query device for initial value
  if (test_bit(EV_ABS, bit[0])) {
    ioctl(fd, EVIOCGBIT(EV_ABS, KEY_MAX), bit[EV_ABS]);
    if (test_bit(ABS_VOLUME, bit[EV_ABS])) {
      ioctl(fd, EVIOCGABS(ABS_VOLUME), abs);
      volume = abs[0];
    }
  }
   
// daemon control
  if (fork())
    return 0;

  close(0);
  close(1);
  close(2);

  openlog("volumed", 0, LOG_DAEMON);

  // initialize pulseaudio
  mainloop = pa_mainloop_new();
  if (!mainloop) {
      syslog(LOG_ERR, "Could not create PulseAudio main loop\n");
      return quit(EXIT_FAILURE);
  }

  mainloop_api = pa_mainloop_get_api(mainloop);
  if (pa_signal_init(mainloop_api) != 0) {
      syslog(LOG_ERR, "Could not initialize PulseAudio UNIX signal subsystem\n");
      return quit(EXIT_FAILURE);
  }

  context = pa_context_new(mainloop_api, argv[0]);
  if (!context || init_context(context, retval) != 0) {
      syslog(LOG_ERR, "Could not initialize PulseAudio context\n");
      return quit(EXIT_FAILURE);
  }

  syslog(LOG_INFO, "volumed initialized\n");
  syslog(LOG_INFO, "listening on %s\n", argv[argc - 1]);
  while (1) {
    wait_loop(pa_context_get_server_info(context, get_server_info, &default_sink_name));
    wait_loop(pa_context_get_sink_info_by_name(context, (char *) default_sink_name, set_volume, &volume));

    rd = read(fd, ev, sizeof(struct input_event) * 64);

    if (rd < (int) sizeof(struct input_event)) {
      syslog(LOG_ERR, "error reading from event device... exiting\n");
    }
    for (i = 0; i < rd / sizeof(struct input_event); i++)
      if ((ev[i].type == EV_ABS) && (ev[i].code == ABS_VOLUME))
          if (ev[i].value > 100) {
            syslog(LOG_WARNING, "event value over 100 ignored\n");
          }else {
            volume = ev[i].value;
          }
  }
}
