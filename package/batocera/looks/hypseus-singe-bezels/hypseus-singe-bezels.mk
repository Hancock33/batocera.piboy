################################################################################
#
# hypseus-singe-bezels
#
################################################################################
# Version: Commits on Jun 27, 2024
HYPSEUS_SINGE_BEZELS_VERSION = 601f3d4c249c21b8a1c2ea2246de634090fa8365
HYPSEUS_SINGE_BEZELS_SITE = $(call github,Tovarichtch,hypseus_singe_daphne_bezels,$(HYPSEUS_SINGE_BEZELS_VERSION))
HYPSEUS_SINGE_BEZELS_LICENSE = LGPL-3.0
HYPSEUS_SINGE_BEZELS_LICENSE_FILES = LICENSE
HYPSEUS_SINGE_BEZELS_DEPENDENCIES = ffmpeg-python

define HYPSEUS_SINGE_BEZELS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/default.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/Daphne/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/Singe/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/Kimmy/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
endef

$(eval $(generic-package))
