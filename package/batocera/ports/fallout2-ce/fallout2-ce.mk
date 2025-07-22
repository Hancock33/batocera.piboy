################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Jul 22, 2025
FALLOUT2_CE_VERSION = fd25944a9e3c22751b14a64f4761b4621d382d92
FALLOUT2_CE_SITE = $(call github,fallout2-ce,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
