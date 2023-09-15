################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Sept 15, 2023
FALLOUT1_CE_VERSION = 64c182919ac718b159bf3f8c6a1866dc2790388c
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2

define FALLOUT1_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout-ce $(TARGET_DIR)/usr/bin/fallout-ce
endef

$(eval $(cmake-package))
