################################################################################
#
# fallout2
#
################################################################################
# Version: Commits on Apr 26, 2023
FALLOUT2_VERSION = a8815229a066e2af6ec0e735f1e744e468b28dcd
FALLOUT2_SITE = $(call github,alexbatalov,fallout2-ce,$(FALLOUT2_VERSION))

FALLOUT2_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf host-ninja
FALLOUT2_LICENSE = GPL-3.0
FALLOUT2_SUPPORTS_IN_SOURCE_BUILD = NO

FALLOUT2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define FALLOUT2_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(FALLOUT2_BUILDDIR)
endef

define FALLOUT2_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/fallout2-ce $(TARGET_DIR)/usr/bin/fallout2-ce
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/fallout2/fallout2.keys $(TARGET_DIR)/usr/share/evmapy/fallout1.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/fallout2/fallout2.keys $(TARGET_DIR)/usr/share/evmapy/fallout2.keys
endef

$(eval $(cmake-package))
