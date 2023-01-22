################################################################################
#
# libretro-zc250x
#
################################################################################
# Version: Commits on Jan 22, 2023
LIBRETRO_ZC250X_VERSION = b57baa492a64cf2c9fd75d7132450af6f3fe4fab
LIBRETRO_ZC250X_SITE = https://github.com/netux79/zc250x-libretro.git
LIBRETRO_ZC250X_SITE_METHOD=git
LIBRETRO_ZC250X_GIT_SUBMODULES=YES
LIBRETRO_ZC250X_LICENSE = GPLv2
LIBRETRO_ZC250X_DEPENDENCIES = retroarch

LIBRETRO_ZC250X_PLATFORM = $(LIBRETRO_PLATFORM)

LIBRETRO_ZC250X_EXTRA_ARGS =

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_ZC250X_PLATFORM = armv

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_ZC250X_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_ZC250X_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
LIBRETRO_ZC250X_PLATFORM = rpi3

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_ZC250X_PLATFORM = rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_ZC250X_PLATFORM = rpi4_64

else ifeq ($(BR2_aarch64),y)
LIBRETRO_ZC250X_PLATFORM = unix
endif

ifeq ($(BR2_x86_64),y)
LIBRETRO_ZC250X_PLATFORM = unix
LIBRETRO_ZC250X_EXTRA_ARGS +=
endif

define LIBRETRO_ZC250X_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_ZC250X_PLATFORM)" $(LIBRETRO_ZC250X_EXTRA_ARGS) \
        GIT_VERSION="-$(shell echo $(LIBRETRO_ZC250X_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_ZC250X_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/zc250x_libretro.so $(TARGET_DIR)/usr/lib/libretro/zc250x_libretro.so
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/zc250x
	cp -avr $(@D)/datfile/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/zc250x
	# install core info file
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	cp -a $(@D)/info/*.info $(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(generic-package))
