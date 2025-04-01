################################################################################
#
# dolphinCrosshairsPack
#
################################################################################
# Version: Commits on Jan 20, 2024
DOLPHINCROSSHAIRSPACK_VERSION = b78ab6cb5a6d5e34f6e2ec16f551e00540a29ed5
DOLPHINCROSSHAIRSPACK_SITE = $(call github,ProfgLX,Dolphin-Lightguns-Accuracy-Inis,$(DOLPHINCROSSHAIRSPACK_VERSION))

define DOLPHINCROSSHAIRSPACK_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
	mkdir -p $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
	cp -a $(@D)/Crosshair*/Load/Textures/* $(TARGET_DIR)/usr/share/DolphinCrosshairsPack
endef

$(eval $(generic-package))
