################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Aug 07, 2023
FALLOUT1_CE_VERSION = 6be823cf7c614a693aca3ab6a4a8aa1df2537793
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2
FALLOUT1_CE_CMAKE_BACKEND = ninja

FALLOUT1_CE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define FALLOUT1_CE_INSTALL_TARGET_CMDS
    cp $(@D)/fallout-ce $(TARGET_DIR)/usr/bin/fallout-ce
endef

$(eval $(cmake-package))
