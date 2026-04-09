################################################################################
#
# retroarch-assets
#
################################################################################
# Version: Commits on Apr 09, 2026
RETROARCH_ASSETS_VERSION = 9ba4071d04cbd00404a52b5c6c41cf9d3cf218fb
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
