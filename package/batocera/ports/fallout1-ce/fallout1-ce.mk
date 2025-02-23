################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Jan 15, 2025
FALLOUT1_CE_VERSION = 0609bcfd0ec40ff0571d0f57fab2821eb461dc8b
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2

define FALLOUT1_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout-ce $(TARGET_DIR)/usr/bin/fallout1-ce
endef

$(eval $(cmake-package))
