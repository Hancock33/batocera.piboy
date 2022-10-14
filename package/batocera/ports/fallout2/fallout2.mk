################################################################################
#
# fallout2
#
################################################################################
# Version: Commits on Oct 14, 2022
FALLOUT2_VERSION = 21aec548af2ab8349b72a5d574add3bf7d1c52ff
FALLOUT2_SITE = $(call github,alexbatalov,fallout2-ce,$(FALLOUT2_VERSION))

FALLOUT2_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
FALLOUT2_LICENSE = GPL-3.0
FALLOUT2_SUPPORTS_IN_SOURCE_BUILD = NO

FALLOUT2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define FALLOUT2_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/fallout2/fallout2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
