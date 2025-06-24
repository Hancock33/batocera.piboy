################################################################################
#
# fallout2-ce
#
################################################################################
# Version: Commits on Jun 24, 2025
FALLOUT2_CE_VERSION = 0303a00299bbf016d32526a60e64e4b02d25899a
FALLOUT2_CE_SITE = $(call github,fallout2-ce,fallout2-ce,$(FALLOUT2_CE_VERSION))
FALLOUT2_CE_DEPENDENCIES = sdl2

FALLOUT2_CE_CONF_OPTS += -DFALLOUT_VENDORED=OFF

define FALLOUT2_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
endef

$(eval $(cmake-package))
