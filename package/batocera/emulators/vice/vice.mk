################################################################################
#
# vice
#
################################################################################
# Version: Commits on Jan 23, 2025
VICE_VERSION = r45465
VICE_SITE = $(call github,VICE-Team,svn-mirror,$(VICE_VERSION))
VICE_LICENSE = GPLv2
VICE_DEPENDENCIES = alsa-lib ffmpeg4 giflib host-dos2unix host-xa jpeg lame libcurl libpng sdl2 sdl2_image zlib
VICE_SUBDIR  = vice

VICE_CONF_OPTS += --disable-debug-gtk3ui
VICE_CONF_OPTS += --disable-html-docs
VICE_CONF_OPTS += --disable-option-checking
VICE_CONF_OPTS += --disable-pdf-docs
VICE_CONF_OPTS += --enable-arch=yes
VICE_CONF_OPTS += --enable-ffmpeg
VICE_CONF_OPTS += --enable-midi
VICE_CONF_OPTS += --enable-sdl2ui
VICE_CONF_OPTS += --enable-x64
VICE_CONF_OPTS += --with-alsa
VICE_CONF_OPTS += --with-evdev
VICE_CONF_OPTS += --with-fastsid
VICE_CONF_OPTS += --with-flac
VICE_CONF_OPTS += --with-gif
VICE_CONF_OPTS += --with-jpeg
VICE_CONF_OPTS += --with-lame
VICE_CONF_OPTS += --with-mpg123
VICE_CONF_OPTS += --with-png
VICE_CONF_OPTS += --with-sdlsound
VICE_CONF_OPTS += --with-vorbis
VICE_CONF_OPTS += --with-zlib
VICE_CONF_OPTS += --without-pulse

VICE_CONF_ENV += PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/ffmpeg4.4/pkgconfig"
VICE_CONF_ENV += CFLAGS="-I$(STAGING_DIR)/usr/include/ffmpeg4.4:$(TARGET_CFLAGS)"
VICE_CONF_ENV += LDFLAGS="-lSDL2 -L$(STAGING_DIR)/usr/lib/ffmpeg4.4"

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
