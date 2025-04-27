################################################################################
#
# libretro-gearsystem
#
################################################################################
# Version: Commits on Apr 26, 2025
LIBRETRO_GEARSYSTEM_VERSION = 04e72efe420b24c549bd01d75c15a9c3bd5ad419
LIBRETRO_GEARSYSTEM_SITE = $(call github,drhelius,Gearsystem,$(LIBRETRO_GEARSYSTEM_VERSION))
LIBRETRO_GEARSYSTEM_LICENSE = GPLv3
LIBRETRO_GEARSYSTEM_DEPENDENCIES = retroarch

define LIBRETRO_GEARSYSTEM_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/platforms/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/platforms/libretro -f Makefile platform="unix"
endef

define LIBRETRO_GEARSYSTEM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/platforms/libretro/gearsystem_libretro.so $(TARGET_DIR)/usr/lib/libretro/gearsystem_libretro.so
endef

$(eval $(generic-package))
