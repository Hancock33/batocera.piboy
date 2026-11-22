################################################################################
#
# batocera-audio
#
################################################################################

BATOCERA_AUDIO_VERSION = 6.11
BATOCERA_AUDIO_LICENSE = GPL
BATOCERA_AUDIO_SOURCE =

# this one is important because the package erase the default pipewire config files, so it must be built after it
BATOCERA_AUDIO_DEPENDENCIES = pipewire wireplumber alsa-ucm-conf

ifeq ($(BR2_PACKAGE_FFMPEG),y)
BATOCERA_AUDIO_DEPENDENCIES += pipewire-ffmpeg-plugins
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3326),y)
BATOCERA_AUDIO_ALSA_SUFFIX = "-rk3326"
else
BATOCERA_AUDIO_ALSA_SUFFIX =
endif

define BATOCERA_AUDIO_INSTALL_TARGET_CMDS
	# default alsa configurations
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/batocera/alsa $(BATOCERA_AUDIO_PKGDIR)/alsa/asoundrc-*
	# sample audio files
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/sounds $(BATOCERA_AUDIO_PKGDIR)/*.wav
	# init script
	$(INSTALL) -D -m 0755 $(BATOCERA_AUDIO_PKGDIR)/Saudio $(TARGET_DIR)/etc/init.d/S20audio
	$(INSTALL) -D -m 0755 $(BATOCERA_AUDIO_PKGDIR)/S27audioconfig $(TARGET_DIR)/etc/init.d/S27audioconfig
	# udev script to unmute audio devices
	$(INSTALL) -D -m 0644 $(BATOCERA_AUDIO_PKGDIR)/90-alsa-setup.rules $(TARGET_DIR)/etc/udev/rules.d/90-alsa-setup.rules
	$(INSTALL) -D -m 0755 $(BATOCERA_AUDIO_PKGDIR)/soundconfig $(TARGET_DIR)/usr/bin/soundconfig
	$(INSTALL) -D -m 0755 $(BATOCERA_AUDIO_PKGDIR)/alsa/batocera-audio$(BATOCERA_AUDIO_ALSA_SUFFIX) $(TARGET_DIR)/usr/bin/batocera-audio
	$(INSTALL) -D -m 0755 $(BATOCERA_AUDIO_PKGDIR)/alsa/batocera-mixer $(TARGET_DIR)/usr/bin/batocera-mixer
	# pipewire-pulse policy
	$(INSTALL) -D -m 0644 $(BATOCERA_AUDIO_PKGDIR)/pulseaudio-system.conf $(TARGET_DIR)/etc/dbus-1/system.d/pulseaudio-system.conf
	# pipewire-alsa
	mkdir -p $(TARGET_DIR)/etc/alsa/conf.d
	ln -sf /usr/share/alsa/alsa.conf.d/50-pipewire.conf $(TARGET_DIR)/etc/alsa/conf.d/50-pipewire.conf
	ln -sf /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf $(TARGET_DIR)/etc/alsa/conf.d/99-pipewire-default.conf
	# pipewire-media-session config: disable dbus device reservation
	$(INSTALL) -D -m 0644 $(BATOCERA_AUDIO_PKGDIR)/80-disable-alsa-reserve.conf $(TARGET_DIR)/usr/share/wireplumber/wireplumber.conf.d/80-disable-alsa-reserve.conf
	$(INSTALL) -D -m 0644 $(BATOCERA_AUDIO_PKGDIR)/pipewire.conf $(TARGET_DIR)/usr/share/pipewire/pipewire.conf
endef

define BATOCERA_AUDIO_X86_INTEL_DSP
	$(INSTALL) -D -m 0644 $(BATOCERA_AUDIO_PKGDIR)/intel-dsp.conf $(TARGET_DIR)/etc/modprobe.d/intel-dsp.conf
endef

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
BATOCERA_AUDIO_DEPENDENCIES += sound-open-firmware steamdeck-dsp
BATOCERA_AUDIO_POST_INSTALL_TARGET_HOOKS += BATOCERA_AUDIO_X86_INTEL_DSP
endif
$(eval $(generic-package))
