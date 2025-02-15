################################################################################
#
# vice
#
################################################################################
# Version: Commits on Feb 16, 2025
VICE_VERSION = r45498
VICE_SITE = $(call github,VICE-Team,svn-mirror,$(VICE_VERSION))
VICE_LICENSE = GPLv2
VICE_SUBDIR  = vice
VICE_DEPENDENCIES =  alsa-lib giflib host-dos2unix host-xa jpeg libcurl libpng zlib

VICE_CONF_OPTS += --disable-debug-gtk3ui
VICE_CONF_OPTS += --disable-option-checking
VICE_CONF_OPTS += --disable-pdf-docs
VICE_CONF_OPTS += --with-alsa
VICE_CONF_OPTS += --with-png
VICE_CONF_OPTS += --with-fastsid
VICE_CONF_OPTS += --without-pulse
VICE_CONF_OPTS += --enable-x64
VICE_CONF_OPTS += --enable-arch=yes
VICE_CONF_OPTS += --enable-midi

ifeq ($(BR2_PACKAGE_SDL2),y)
VICE_CONF_OPTS += --enable-sdl2ui
VICE_CONF_OPTS += --with-sdlsound
VICE_CONF_ENV += LDFLAGS=-lSDL2
VICE_DEPENDENCIES += sdl2 sdl2_image
endif

ifeq ($(BR2_PACKAGE_FLAC),y)
VICE_CONF_OPTS += --with-flac
VICE_DEPENDENCIES += flac
endif

ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
VICE_CONF_OPTS += --with-vorbis
VICE_DEPENDENCIES += libvorbis
endif

ifeq ($(BR2_PACKAGE_LAME),y)
VICE_CONF_OPTS += --with-lame
VICE_DEPENDENCIES += lame
endif

define VICE_SRC_AUTOCONFIGURE
	cd $(@D)/vice && ./autogen.sh
endef

define VICE_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vice/c64.vice.keys $(TARGET_DIR)/usr/share/evmapy
endef

VICE_POST_EXTRACT_HOOKS += VICE_SRC_AUTOCONFIGURE
VICE_POST_INSTALL_TARGET_HOOKS += VICE_POST_PROCESS

$(eval $(autotools-package))
