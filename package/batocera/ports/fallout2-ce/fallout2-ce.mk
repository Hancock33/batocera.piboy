################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Aug 26, 2025
FALLOUT2_CE_VERSION = 571b43410d2d6aebd47a6ea1c8ddeeec3c7388ef
FALLOUT2_CE_SITE = $(call github,fallout2-ce,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
