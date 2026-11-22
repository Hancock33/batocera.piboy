################################################################################
#
# xroar
#
################################################################################
# Version: Commits on Nov 15, 2026
XROAR_VERSION = 1.13.1
XROAR_SITE = https://www.6809.org.uk/xroar/dl
XROAR_LICENSE = GPL-3.0
XROAR_LICENSE_FILES = COPYING.GPL
XROAR_EMULATOR_INFO = xroar.emulator.yml

XROAR_DEPENDENCIES = alsa-lib libevdev libpng sdl2 sdl2_image zlib

# supported systems
XROAR_CONF_OPTS += --enable-dragon
XROAR_CONF_OPTS += --enable-coco3
XROAR_CONF_OPTS += --enable-mc10
# emu config options
XROAR_CONF_OPTS += --without-gtk2
XROAR_CONF_OPTS += --without-cocoa
XROAR_CONF_OPTS += --without-oss
XROAR_CONF_OPTS += --without-coreaudio
XROAR_CONF_OPTS += --without-pulse
XROAR_CONF_OPTS += --without-gtk3
XROAR_CONF_OPTS += --without-gtkgl

ifeq ($(BR2_PACKAGE_XORG7),y)
    XROAR_DEPENDENCIES += xlib_libX11 xlib_libXext
    XROAR_CONF_OPTS += --with-x
else
    XROAR_CONF_OPTS += --without-x
endif

$(eval $(autotools-package))
$(eval $(emulator-info-package))
