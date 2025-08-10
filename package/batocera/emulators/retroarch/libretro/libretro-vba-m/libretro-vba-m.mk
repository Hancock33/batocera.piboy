################################################################################
#
# libretro-vba-m
#
################################################################################
# Version: Commits on Aug 08, 2025
LIBRETRO_VBA_M_VERSION = 22f381a19e4841711c0cd6b2621a587f53205549
LIBRETRO_VBA_M_SITE = $(call github,visualboyadvance-m,visualboyadvance-m,$(LIBRETRO_VBA_M_VERSION))
LIBRETRO_VBA_M_DEPENDENCIES = retroarch

define LIBRETRO_VBA_M_BUILD_CMDS
	$(SED) "s|\-O[23fast]|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro -f Makefile platform="unix" \
		CURRENT_COMMIT="-$(shell echo $(LIBRETRO_VBA_M_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_VBA_M_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/libretro/vbam_libretro.so $(TARGET_DIR)/usr/lib/libretro/vba-m_libretro.so
endef

$(eval $(generic-package))
