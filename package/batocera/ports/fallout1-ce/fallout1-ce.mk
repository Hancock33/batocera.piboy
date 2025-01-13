################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Jan 13, 2025
FALLOUT1_CE_VERSION = fbd25f00e9ccfb5391e394272d536206bb86678b
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2

define FALLOUT1_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout-ce $(TARGET_DIR)/usr/bin/fallout1-ce
endef

define FALLOUT1_CE_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/fallout1-ce/fallout1-ce.keys \
	    $(TARGET_DIR)/usr/share/evmapy
endef

FALLOUT1_CE_POST_INSTALL_TARGET_HOOKS += FALLOUT1_CE_EVMAPY

$(eval $(cmake-package))
