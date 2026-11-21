################################################################################
#
# vice
#
################################################################################
# Version: Commits on Nov 21, 2026
VICE_VERSION = r46436
VICE_SITE = $(call github,VICE-Team,svn-mirror,$(VICE_VERSION))
VICE_SUBDIR = vice
VICE_LICENSE = GPL-2.0+
VICE_LICENSE_FILES = vice/COPYING
VICE_DEPENDENCIES = alsa-lib flac giflib host-autoconf host-automake host-bison \
	host-dos2unix host-flex host-xa lame libcurl libpng libvorbis sdl2 sdl2_image zlib
VICE_EMULATOR_INFO = vice.emulator.yml

VICE_CONF_OPTS = \
	--disable-option-checking \
	--disable-html-docs \
	--enable-midi \
	--enable-sdl2ui \
	--enable-x64 \
	--with-alsa \
	--with-fastsid \
	--with-flac \
	--with-gif \
	--with-lame \
	--with-png \
	--with-sdlsound \
	--with-vorbis \
	--without-pulse

ifeq ($(BR2_PACKAGE_MPG123),y)
VICE_CONF_OPTS += --with-mpg123
VICE_DEPENDENCIES += mpg123
endif

ifeq ($(BR2_PACKAGE_LIBUSB),y)
VICE_DEPENDENCIES += libusb
else
VICE_CONF_OPTS += --without-libusb
endif

define VICE_AUTOGEN
	cd $(VICE_SRCDIR) && PATH=$(BR_PATH) ./autogen.sh
endef
VICE_PRE_CONFIGURE_HOOKS += VICE_AUTOGEN

$(eval $(autotools-package))
$(eval $(emulator-info-package))
