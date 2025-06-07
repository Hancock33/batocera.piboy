################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Jun 07, 2025
FALLOUT2_CE_VERSION = 9cb2b83db1a8cb3a1b47e42628efe21003826b3f
FALLOUT2_CE_SITE = $(call github,fallout2-ce,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
