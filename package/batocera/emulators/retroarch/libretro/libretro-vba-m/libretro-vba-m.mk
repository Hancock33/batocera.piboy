################################################################################
#
# libretro-vba-m
#
################################################################################
# Version: Commits on Jan 26, 2026
LIBRETRO_VBA_M_VERSION = d24e4bf7f55edd30a1867639df2cdab9f871329c
LIBRETRO_VBA_M_SITE = $(call github,visualboyadvance-m,visualboyadvance-m,$(LIBRETRO_VBA_M_VERSION))
LIBRETRO_VBA_M_DEPENDENCIES += retroarch
LIBRETRO_VBA_M_EMULATOR_INFO = vba-m.libretro.core.yml

define LIBRETRO_VBA_M_BUILD_CMDS
	$(SED) "s|\-O[23fast]|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro -f Makefile platform="unix" \
		CURRENT_COMMIT="-$(shell echo $(LIBRETRO_VBA_M_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_VBA_M_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/libretro/vbam_libretro.so $(TARGET_DIR)/usr/lib/libretro/vba-m_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))