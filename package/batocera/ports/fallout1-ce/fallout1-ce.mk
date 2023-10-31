################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Oct 31, 2023
FALLOUT1_CE_VERSION = f33143d0db9066d4c654464f66aba58871e4c81e
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2

define FALLOUT1_CE_INSTALL_TARGET_CMDS
	cp $(@D)/fallout-ce $(TARGET_DIR)/usr/bin/fallout-ce
endef

$(eval $(cmake-package))
