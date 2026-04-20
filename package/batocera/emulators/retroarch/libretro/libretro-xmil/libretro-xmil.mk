################################################################################
#
# libretro-xmil
#
################################################################################
# Version: Commits on Apr 20, 2026
LIBRETRO_XMIL_VERSION = 3e7960a433c3bca820f8b8f5511a2b92bd666829
LIBRETRO_XMIL_SITE =  $(call github,libretro,xmil-libretro,$(LIBRETRO_XMIL_VERSION))
LIBRETRO_XMIL_LICENSE = BSD-3
LIBRETRO_XMIL_DEPENDENCIES += retroarch
LIBRETRO_XMIL_EMULATOR_INFO = x1.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_XMIL_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_XMIL_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_XMIL_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_XMIL_PLATFORM = rpi5
else
    LIBRETRO_XMIL_PLATFORM = unix
endif

define LIBRETRO_XMIL_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile.libretro platform=$(LIBRETRO_XMIL_PLATFORM)
endef

define LIBRETRO_XMIL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/libretro/x1_libretro.so $(TARGET_DIR)/usr/lib/libretro/x1_libretro.so
	$(INSTALL) -D $(@D)/x1_libretro.info $(TARGET_DIR)/usr/share/libretro/info/x1_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
