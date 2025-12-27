################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Dec 26, 2025
FALLOUT2_CE_VERSION = 58b811f2ae9402bb613726ed56a886c3151e9b24
FALLOUT2_CE_SITE = $(call github,fallout2-ce,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
