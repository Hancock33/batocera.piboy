################################################################################
#
# dolphinCrosshairsPack
#
################################################################################
# Version: Commits on Mar 03, 2023
DOLPHINCROSSHAIRSPACK_VERSION = v2.0
DOLPHINCROSSHAIRSPACK_SITE = $(call github,ProfgLX,Dolphin-Lightguns-Accuracy-Inis,$(DOLPHINCROSSHAIRSPACK_VERSION))

define DOLPHINCROSSHAIRSPACK_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
	mkdir -p $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
	cp -a $(@D)/Crosshair*/Load/Textures/* $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
endef

$(eval $(generic-package))
