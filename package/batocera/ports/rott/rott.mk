################################################################################
#
# rott
#
################################################################################
# Version: Commits on Nov 23, 2021
ROTT_VERSION = 6989f9535256539dcddeac75fd4e20a16a13e8a4
ROTT_SITE = $(call github,fabiangreffrath,rott,$(ROTT_VERSION))

ROTT_DEPENDENCIES = sdl2 sdl2_mixer
ROTT_LICENSE = GPLv2
ROTT_AUTORECONF = YES
ROTT_CONF_OPTS += --enable-datadir=/userdata/roms/ports/rott

define ROTT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/rott/rott -D $(TARGET_DIR)/usr/bin/rott-darkwar
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rott/rott.keys $(TARGET_DIR)/usr/share/evmapy/rott.keys
endef

$(eval $(autotools-package))