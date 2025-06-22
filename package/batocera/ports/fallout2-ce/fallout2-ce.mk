################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Jun 22, 2025
FALLOUT2_CE_VERSION = ea0afc84fae8a0ea3667c661d95df78bc9c55e4b
FALLOUT2_CE_SITE = $(call github,fallout2-ce,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
