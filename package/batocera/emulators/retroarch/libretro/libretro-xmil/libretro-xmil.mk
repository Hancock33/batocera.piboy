################################################################################
#
# libretro-xmil
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBRETRO_XMIL_VERSION = 927e2eb8c097e88f623efdf15c4372b973a6c5e5
LIBRETRO_XMIL_SITE =  $(call github,libretro,xmil-libretro,$(LIBRETRO_XMIL_VERSION))
LIBRETRO_XMIL_LICENSE = BSD-3

LIBRETRO_XMIL_PLATFORM = unix

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_XMIL_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_XMIL_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_XMIL_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_XMIL_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_XMIL_PLATFORM = rpi5
endif

define LIBRETRO_XMIL_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile.libretro platform=$(LIBRETRO_XMIL_PLATFORM)
endef

define LIBRETRO_XMIL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/x1_libretro.so $(TARGET_DIR)/usr/lib/libretro/x1_libretro.so
endef

$(eval $(generic-package))
