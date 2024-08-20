################################################################################
#
# vice
#
################################################################################
# Version: Commits on Aug 19, 2024
VICE_VERSION = r45315
VICE_SOURCE = vice-$(VICE_VERSION).tar.gz
VICE_SITE = $(call github,VICE-Team,svn-mirror,$(VICE_VERSION))
VICE_LICENSE = GPLv2
VICE_DEPENDENCIES = ffmpeg sdl2 libpng giflib zlib lame alsa-lib jpeg host-xa host-dos2unix sdl2_image libcurl
VICE_SUBDIR  = vice

VICE_CONF_OPTS += --disable-option-checking
VICE_CONF_OPTS += --disable-pdf-docs
VICE_CONF_OPTS += --enable-midi
VICE_CONF_OPTS += --with-lame
VICE_CONF_OPTS += --with-alsa
VICE_CONF_OPTS += --with-zlib
VICE_CONF_OPTS += --with-png
VICE_CONF_OPTS += --with-fastsid
VICE_CONF_OPTS += --without-pulse
VICE_CONF_OPTS += --enable-x64
VICE_CONF_OPTS += --enable-arch=yes
VICE_CONF_OPTS += --enable-sdl2ui
VICE_CONF_OPTS += --with-sdlsound
VICE_CONF_OPTS += --disable-debug-gtk3ui

VICE_CONF_ENV += LDFLAGS=-lSDL2

define VICE_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vice/c64.vice.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

VICE_POST_INSTALL_TARGET_HOOKS += VICE_POST_PROCESS

define VICE_SRC_MOVE
	cd $(@D)/vice && ./autogen.sh
endef

VICE_POST_EXTRACT_HOOKS += VICE_SRC_MOVE

$(eval $(autotools-package))
