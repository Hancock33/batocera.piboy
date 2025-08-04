################################################################################
#
# hypseus-singe-bezels
#
################################################################################
# Version: Commits on Aug 04, 2025
HYPSEUS_SINGE_BEZELS_VERSION = 509aed4e75954a918cc34a0ba89efb2c7ae868b3
HYPSEUS_SINGE_BEZELS_SITE = $(call github,Tovarichtch,hypseus_singe_daphne_bezels,$(HYPSEUS_SINGE_BEZELS_VERSION))
HYPSEUS_SINGE_BEZELS_LICENSE = LGPL-3.0
HYPSEUS_SINGE_BEZELS_LICENSE_FILES = LICENSE
HYPSEUS_SINGE_BEZELS_DEPENDENCIES = ffmpeg-python

define HYPSEUS_SINGE_BEZELS_INSTALL_TARGET_CMDS
	rm -rf   $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	#mkdir -p $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	#cp -f $(@D)/default.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	#cp -f $(@D)/Daphne/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	#cp -f $(@D)/Singe/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	#cp -f $(@D)/Kimmy/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/decorations/hypseus-singe
	mkdir -p $(TARGET_DIR)/usr/share/hypseus-singe
	ln -sf /userdata/decorations/hypseus-singe $(TARGET_DIR)/usr/share/hypseus-singe/bezels
endef

$(eval $(generic-package))
