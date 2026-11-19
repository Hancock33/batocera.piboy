################################################################################
#
# rott
#
################################################################################
# Version: Commits on Nov 19, 2026
ROTT_VERSION = cb59bd899f7d75946c1297e9a0f94999fa76742a
ROTT_SITE = $(call github,fabiangreffrath,taradino,$(ROTT_VERSION))
ROTT_LICENSE = GPLv2
ROTT_LICENSE_FILE = README.md
ROTT_EMULATOR_INFO = taradino.emulator.yml
ROTT_DEPENDENCIES = sdl2 sdl2_mixer

ROTT_SUPPORTS_IN_SOURCE_BUILD = NO

ROTT_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define ROTT_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rott/rott.keys $(TARGET_DIR)/usr/share/evmapy
endef
ROTT_POST_INSTALL_TARGET_HOOKS += ROTT_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
