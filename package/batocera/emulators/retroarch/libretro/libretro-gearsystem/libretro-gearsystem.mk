################################################################################
#
# libretro-gearsystem
#
################################################################################
# Version: Commits on Oct 10, 2026
LIBRETRO_GEARSYSTEM_VERSION = 5bb4c0d77fe63675257f08902ef7a4a7c5ae22c3
LIBRETRO_GEARSYSTEM_SITE = $(call github,drhelius,Gearsystem,$(LIBRETRO_GEARSYSTEM_VERSION))
LIBRETRO_GEARSYSTEM_LICENSE = GPLv3
LIBRETRO_GEARSYSTEM_DEPENDENCIES += retroarch
LIBRETRO_GEARSYSTEM_EMULATOR_INFO = gearsystem.libretro.core.yml

define LIBRETRO_GEARSYSTEM_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/platforms/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/platforms/libretro -f Makefile platform="unix"
endef

define LIBRETRO_GEARSYSTEM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/platforms/libretro/gearsystem_libretro.so $(TARGET_DIR)/usr/lib/libretro/gearsystem_libretro.so
	$(INSTALL) -D $(@D)/platforms/libretro/gearsystem_libretro.info $(TARGET_DIR)/usr/share/libretro/info/gearsystem_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
