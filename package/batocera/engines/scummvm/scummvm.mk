################################################################################
#
# scummvm
#
################################################################################
# Version: Commits on Oct 10, 2026
SCUMMVM_VERSION = v2026.4.0
SCUMMVM_SITE = $(call github,scummvm,scummvm,$(SCUMMVM_VERSION))
SCUMMVM_LICENSE = GPL-2.0+
SCUMMVM_LICENSE_FILES = COPYING
SCUMMVM_EMULATOR_INFO = scummvm.emulator.yml

SCUMMVM_DEPENDENCIES += faad2 flac fluidsynth freetype jpeg libmad libmpeg2
SCUMMVM_DEPENDENCIES += libogg libpng libtheora sdl3 zlib

# Not an autoconf script: it only knows its own options, so the generic
# autotools configure step can't be used.
SCUMMVM_CONF_OPTS += --host=$(GNU_TARGET_NAME)
SCUMMVM_CONF_OPTS += --prefix=/usr
SCUMMVM_CONF_OPTS += --prefer-sdl3
SCUMMVM_CONF_OPTS += --opengl-mode=auto

SCUMMVM_CONF_OPTS += --enable-release
SCUMMVM_CONF_OPTS += --enable-optimizations
SCUMMVM_CONF_OPTS += --disable-debug
SCUMMVM_CONF_OPTS += --enable-all-engines
SCUMMVM_CONF_OPTS += --enable-vkeybd

SCUMMVM_CONF_OPTS += --enable-faad
SCUMMVM_CONF_OPTS += --enable-flac
SCUMMVM_CONF_OPTS += --enable-fluidsynth
SCUMMVM_CONF_OPTS += --enable-freetype2
SCUMMVM_CONF_OPTS += --enable-jpeg
SCUMMVM_CONF_OPTS += --enable-mad
SCUMMVM_CONF_OPTS += --enable-mpeg2
SCUMMVM_CONF_OPTS += --enable-mt32emu
SCUMMVM_CONF_OPTS += --enable-ogg
SCUMMVM_CONF_OPTS += --enable-png
SCUMMVM_CONF_OPTS += --enable-theoradec
SCUMMVM_CONF_OPTS += --enable-zlib

# Desktop integration and host-only features
SCUMMVM_CONF_OPTS += --disable-alsa
SCUMMVM_CONF_OPTS += --disable-discord
SCUMMVM_CONF_OPTS += --disable-eventrecorder
SCUMMVM_CONF_OPTS += --disable-gtk
SCUMMVM_CONF_OPTS += --disable-libunity
SCUMMVM_CONF_OPTS += --disable-readline
SCUMMVM_CONF_OPTS += --disable-seq-midi
SCUMMVM_CONF_OPTS += --disable-sndio
SCUMMVM_CONF_OPTS += --disable-taskbar
SCUMMVM_CONF_OPTS += --disable-timidity
SCUMMVM_CONF_OPTS += --disable-tts
SCUMMVM_CONF_OPTS += --disable-updates

# Tremor (integer Vorbis decoder) on targets without a fast FPU
ifeq ($(BR2_arm)$(BR2_mipsel),y)
SCUMMVM_DEPENDENCIES += tremor
SCUMMVM_CONF_OPTS += --enable-tremor --disable-vorbis
else
SCUMMVM_DEPENDENCIES += libvorbis
SCUMMVM_CONF_OPTS += --enable-vorbis --disable-tremor
endif

# Optional libraries: pin them so the result doesn't depend on build order
ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
SCUMMVM_DEPENDENCIES += libgl
else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
SCUMMVM_DEPENDENCIES += libgles
endif

ifeq ($(BR2_PACKAGE_GIFLIB),y)
SCUMMVM_DEPENDENCIES += giflib
SCUMMVM_CONF_OPTS += --enable-gif
else
SCUMMVM_CONF_OPTS += --disable-gif
endif

ifeq ($(BR2_PACKAGE_LIBCURL),y)
SCUMMVM_DEPENDENCIES += libcurl
SCUMMVM_CONF_OPTS += --enable-libcurl
else
SCUMMVM_CONF_OPTS += --disable-libcurl --disable-cloud
endif

ifeq ($(BR2_PACKAGE_LIBOPENMPT),y)
SCUMMVM_DEPENDENCIES += libopenmpt
SCUMMVM_CONF_OPTS += --enable-openmpt
else
SCUMMVM_CONF_OPTS += --disable-openmpt
endif

ifeq ($(BR2_PACKAGE_LIBVPX),y)
SCUMMVM_DEPENDENCIES += libvpx
SCUMMVM_CONF_OPTS += --enable-vpx
else
SCUMMVM_CONF_OPTS += --disable-vpx
endif

ifeq ($(BR2_PACKAGE_SDL3_NET),y)
SCUMMVM_DEPENDENCIES += sdl3_net
SCUMMVM_CONF_OPTS += --enable-sdlnet
else
SCUMMVM_CONF_OPTS += --disable-sdlnet
endif

SCUMMVM_CONF_ENV += \
	PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"

define SCUMMVM_CONFIGURE_CMDS
	cd $(@D) && \
	$(TARGET_CONFIGURE_OPTS) $(SCUMMVM_CONF_ENV) \
	./configure $(SCUMMVM_CONF_OPTS)
endef

$(eval $(autotools-package))
$(eval $(emulator-info-package))
