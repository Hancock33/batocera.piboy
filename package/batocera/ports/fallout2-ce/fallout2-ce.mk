################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Oct 09, 2023
FALLOUT2_CE_VERSION = 81fce5f4a29a51c983780225b9f0538573bea727
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
