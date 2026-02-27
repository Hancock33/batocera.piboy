################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Feb 27, 2026
FALLOUT2_CE_VERSION = 36336528845dfc0eadd42452320ff6c0a0f53bd6
FALLOUT2_CE_SITE = $(call github,fallout2-ce,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2
FALLOUT2_CE_EMULATOR_INFO = fallout2-ce.emulator.yml

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
