################################################################################
#
# libretro-vba-m
#
################################################################################
# Version: Commits on Aug 28, 2026
LIBRETRO_VBA_M_VERSION = 5b9b6e17168248dfc90b4042fcf6ac254dbd4df9
LIBRETRO_VBA_M_SITE = $(call github,visualboyadvance-m,visualboyadvance-m,$(LIBRETRO_VBA_M_VERSION))
LIBRETRO_VBA_M_DEPENDENCIES += retroarch
LIBRETRO_VBA_M_EMULATOR_INFO = vba-m.libretro.core.yml

LIBRETRO_VBA_M_CONF_OPTS += -DENABLE_LIBRETRO=ON

define LIBRETRO_VBA_M_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/vbam_libretro.so $(TARGET_DIR)/usr/lib/libretro/vba-m_libretro.so
	$(INSTALL) -D $(@D)/src/libretro/vbam_libretro.info $(TARGET_DIR)/usr/share/libretro/info/vba-m_libretro.info
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
