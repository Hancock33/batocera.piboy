################################################################################
#
# vice
#
################################################################################
# Version: Commits on Feb 16, 2026
VICE_VERSION = r45971
VICE_SITE = $(call github,VICE-Team,svn-mirror,$(VICE_VERSION))
VICE_LICENSE = GPLv2
VICE_SUBDIR  = vice
VICE_DEPENDENCIES = alsa-lib giflib host-dos2unix host-xa jpeg libcurl sdl2 sdl2_image zlib
VICE_CONF_ENV += LDFLAGS=-lSDL2
VICE_EMULATOR_INFO = vice.emulator.yml

VICE_CONF_OPTS += --disable-debug-gtk3ui
VICE_CONF_OPTS += --disable-html-docs
VICE_CONF_OPTS += --disable-option-checking
VICE_CONF_OPTS += --disable-pdf-docs
VICE_CONF_OPTS += --enable-arch=yes
VICE_CONF_OPTS += --enable-midi
VICE_CONF_OPTS += --enable-sdl2ui
VICE_CONF_OPTS += --enable-x64
VICE_CONF_OPTS += --with-alsa
VICE_CONF_OPTS += --with-fastsid
VICE_CONF_OPTS += --with-gif
VICE_CONF_OPTS += --with-sdlsound
VICE_CONF_OPTS += --without-pulse

ifeq ($(BR2_PACKAGE_MPG123),y)
VICE_CONF_OPTS += --with-mpg123
VICE_DEPENDENCIES += mpg123
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

ifeq ($(BR2_PACKAGE_LIBPNG),y)
VICE_CONF_OPTS += --with-png
VICE_DEPENDENCIES += libpng
endif

define VICE_SRC_AUTOCONFIGURE
	cd $(@D)/vice && ./autogen.sh
endef

VICE_POST_EXTRACT_HOOKS += VICE_SRC_AUTOCONFIGURE

$(eval $(autotools-package))
$(eval $(emulator-info-package))
