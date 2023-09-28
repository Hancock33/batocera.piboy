################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Sept 28, 2023
FALLOUT1_CE_VERSION = 271601221e42faff5bff936e45c81106e87a2dc2
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2

define FALLOUT1_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout-ce $(TARGET_DIR)/usr/bin/fallout-ce
endef

$(eval $(cmake-package))
