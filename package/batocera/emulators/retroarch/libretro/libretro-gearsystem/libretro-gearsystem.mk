################################################################################
#
# libretro-gearsystem
#
################################################################################
# Version: Commits on Dec 08, 2023
LIBRETRO_GEARSYSTEM_VERSION = 54e380527853c7cdd64231353ee6c343af1400a4
LIBRETRO_GEARSYSTEM_SITE = $(call github,drhelius,Gearsystem,$(LIBRETRO_GEARSYSTEM_VERSION))
LIBRETRO_GEARSYSTEM_LICENSE = GPLv3

define LIBRETRO_GEARSYSTEM_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/platforms/libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/platforms/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/platforms/libretro -f Makefile platform="unix"
endef

define LIBRETRO_GEARSYSTEM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/platforms/libretro/gearsystem_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/gearsystem_libretro.so
endef

$(eval $(generic-package))
