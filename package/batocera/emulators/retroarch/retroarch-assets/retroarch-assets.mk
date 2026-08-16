################################################################################
#
# retroarch-assets
#
################################################################################
# Version: Commits on Aug 13, 2026
RETROARCH_ASSETS_VERSION = 73106363e14e34c08a5854b4cfbc29f184e3b783
RETROARCH_ASSETS_SITE = $(call github,libretro,retroarch-assets,$(RETROARCH_ASSETS_VERSION))
RETROARCH_ASSETS_LICENSE = GPL

define RETROARCH_ASSETS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/assets/xmb
	cp -r $(@D)/ozone $(TARGET_DIR)/usr/share/libretro/assets
	cp -r $(@D)/rgui $(TARGET_DIR)/usr/share/libretro/assets
	cp -r $(@D)/glui $(TARGET_DIR)/usr/share/libretro/assets
	cp -r $(@D)/xmb/monochrome $(TARGET_DIR)/usr/share/libretro/assets/xmb
endef

$(eval $(generic-package))
