################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Sept 28, 2023
FALLOUT2_CE_VERSION = 0e447c55a814cbc5472ca8359ecfdc9f24235c0b
FALLOUT2_CE_SITE = $(call github,alexbatalov,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/fallout2-ce/fallout2.keys $(TARGET_DIR)/usr/share/evmapy/fallout1.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/fallout2-ce/fallout2.keys $(TARGET_DIR)/usr/share/evmapy/fallout2.keys
endef

$(eval $(cmake-package))
