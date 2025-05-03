################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Feb 16, 2025
FALLOUT2_CE_VERSION = e97087b9582f37075db347a89898887320753f8b
FALLOUT2_CE_SITE = $(call github,alexbatalov,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
