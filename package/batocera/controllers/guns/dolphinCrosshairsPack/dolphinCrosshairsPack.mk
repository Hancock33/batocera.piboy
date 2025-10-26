################################################################################
#
# dolphinCrosshairsPack
#
################################################################################
# Version: Commits on Oct 21, 2025
DOLPHINCROSSHAIRSPACK_VERSION = e5a6dce4b6e12b0659381d56dfabe2d478dd25b1
DOLPHINCROSSHAIRSPACK_SITE = $(call github,ProfgLX,Dolphin-Lightguns-Accuracy-Inis,$(DOLPHINCROSSHAIRSPACK_VERSION))

define DOLPHINCROSSHAIRSPACK_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
	mkdir -p $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
	cp -a $(@D)/Crosshair*/Load/Textures/* $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
endef

$(eval $(generic-package))
