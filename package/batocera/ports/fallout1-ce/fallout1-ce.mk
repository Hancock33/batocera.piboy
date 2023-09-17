################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Sept 16, 2023
FALLOUT1_CE_VERSION = 1db15fe6b5d65cbf7aaa3e5f543e3291b6eb547d
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2

define FALLOUT1_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout-ce $(TARGET_DIR)/usr/bin/fallout-ce
endef

$(eval $(cmake-package))
