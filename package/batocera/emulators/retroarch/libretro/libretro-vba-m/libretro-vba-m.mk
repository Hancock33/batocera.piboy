################################################################################
#
# libretro-vba-m
#
################################################################################
# Version: Commits on Mar 11, 2024
LIBRETRO_VBA_M_VERSION = b45a4066b1315192aa6e7c97447fda2750d60996
LIBRETRO_VBA_M_SITE = $(call github,visualboyadvance-m,visualboyadvance-m,$(LIBRETRO_VBA_M_VERSION))

define LIBRETRO_VBA_M_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro -f Makefile platform="unix"  \
		CURRENT_COMMIT="-$(shell echo $(LIBRETRO_VBA_M_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_VBA_M_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/libretro/vbam_libretro.so $(TARGET_DIR)/usr/lib/libretro/vba-m_libretro.so
endef

$(eval $(generic-package))
