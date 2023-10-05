################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Oct 05, 2023
FALLOUT1_CE_VERSION = c138d7fb9dd121dea6d6fdc106dad5533c944a24
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2

define FALLOUT1_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout-ce $(TARGET_DIR)/usr/bin/fallout-ce
endef

$(eval $(cmake-package))
