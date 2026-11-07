################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Nov 07, 2026
FALLOUT2_CE_VERSION = 99b6ce6ae1c24fde67aa3bfe13ffaa053cf0bcaf
FALLOUT2_CE_SITE = $(call github,fallout2-ce,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2
FALLOUT2_CE_EMULATOR_INFO = fallout2-ce.emulator.yml

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
