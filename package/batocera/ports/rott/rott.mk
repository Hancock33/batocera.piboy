################################################################################
#
# rott
#
################################################################################
# Version: Commits on Aug 09, 2025
ROTT_VERSION = 849be73e5704049a104d3bb616846148410ed498
ROTT_SITE = $(call github,fabiangreffrath,taradino,$(ROTT_VERSION))
ROTT_LICENSE = GPLv2
ROTT_LICENSE_FILE = README.md

ROTT_DEPENDENCIES = sdl2 sdl2_mixer

ROTT_SUPPORTS_IN_SOURCE_BUILD = NO

ROTT_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define ROTT_INSTALL_TARGET_CMDS
	cp $(@D)/buildroot-build/taradino $(TARGET_DIR)/usr/bin/rott-darkwar
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rott/rott.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
