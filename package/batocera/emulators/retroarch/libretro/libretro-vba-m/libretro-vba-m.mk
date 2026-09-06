################################################################################
#
# libretro-vba-m
#
################################################################################
# Version: Commits on Sept 05, 2026
LIBRETRO_VBA_M_VERSION = c5d79e21e08746569269d45e70d44162ecc5ed74
LIBRETRO_VBA_M_SITE = $(call github,visualboyadvance-m,visualboyadvance-m,$(LIBRETRO_VBA_M_VERSION))
LIBRETRO_VBA_M_DEPENDENCIES += retroarch host-zip
LIBRETRO_VBA_M_EMULATOR_INFO = vba-m.libretro.core.yml

LIBRETRO_VBA_M_CONF_OPTS += -DENABLE_LIBRETRO=ON
LIBRETRO_VBA_M_CONF_OPTS += -DCOMMITHASH=$(shell echo $(LIBRETRO_VBA_M_VERSION) | cut -c 1-7)

define LIBRETRO_VBA_M_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/vbam_libretro.so $(TARGET_DIR)/usr/lib/libretro/vba-m_libretro.so
	$(INSTALL) -D $(@D)/src/libretro/vbam_libretro.info $(TARGET_DIR)/usr/share/libretro/info/vba-m_libretro.info
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
