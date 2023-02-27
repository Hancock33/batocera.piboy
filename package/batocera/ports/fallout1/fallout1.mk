################################################################################
#
# fallout1
#
################################################################################
# Version: Commits on Feb 27, 2023
FALLOUT1_VERSION = 3e94285e3bc6edea0871735d28921bd0cbe29557
FALLOUT1_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_VERSION))

FALLOUT1_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
FALLOUT1_LICENSE = GPL-3.0
FALLOUT1_SUPPORTS_IN_SOURCE_BUILD = NO

FALLOUT1_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define FALLOUT1_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/fallout-ce $(TARGET_DIR)/usr/bin/fallout-ce
endef

$(eval $(cmake-package))
