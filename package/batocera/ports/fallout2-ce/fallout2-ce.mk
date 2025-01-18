################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Jan 14, 2025
FALLOUT2_CE_VERSION = d586e81827c807c79d78757e1f199fb66f9e8273
FALLOUT2_CE_SITE = $(call github,alexbatalov,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

define FALLOUT2_CE_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/fallout2-ce/fallout2-ce.keys \
	    $(TARGET_DIR)/usr/share/evmapy
endef

FALLOUT2_CE_POST_INSTALL_TARGET_HOOKS += FALLOUT2_CE_EVMAPY

$(eval $(cmake-package))
