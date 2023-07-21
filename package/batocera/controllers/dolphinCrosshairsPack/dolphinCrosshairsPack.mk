################################################################################
#
# dolphinCrosshairsPack
#
################################################################################

DOLPHINCROSSHAIRSPACK_VERSION = 0e88a56dc6a9f37c59110c4eec6e1c508042f693
DOLPHINCROSSHAIRSPACK_SITE = $(call github,ProfgLX,Sinden-Dolphin-Accuracy-Inis,$(DOLPHINCROSSHAIRSPACK_VERSION))

define DOLPHINCROSSHAIRSPACK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share
	cp -pr $(@D)/DolphinCrosshairsPack $(TARGET_DIR)/usr/share/
	rm $(TARGET_DIR)"/usr/share/DolphinCrosshairsPack/Readme Crosshair removal Pack.pdf"
endef

$(eval $(generic-package))
