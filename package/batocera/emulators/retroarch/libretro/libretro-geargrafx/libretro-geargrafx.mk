################################################################################
#
# libretro-geargrafx
#
################################################################################
# Version: Commits on Jul 07, 2025
LIBRETRO_GEARGRAFX_VERSION = eaf14d7efcd8e9f558a11d63c3857ee7e0557ea0
LIBRETRO_GEARGRAFX_SITE = $(call github,drhelius,Geargrafx,$(LIBRETRO_GEARGRAFX_VERSION))
LIBRETRO_GEARGRAFX_LICENSE = GPLv3

LIBRETRO_GEARGRAFX_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_GEARGRAFX_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/platforms/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/platforms/libretro -f Makefile platform="$(LIBRETRO_GEARGRAFX_PLATFORM)"
endef

define LIBRETRO_GEARGRAFX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro
	$(INSTALL) -D $(@D)/platforms/libretro/geargrafx_libretro.so $(TARGET_DIR)/usr/lib/libretro/geargrafx_libretro.so
	cp -av $(@D)/platforms/libretro/geargrafx_libretro.info      $(TARGET_DIR)/usr/share/libretro/info
endef

$(eval $(generic-package))
