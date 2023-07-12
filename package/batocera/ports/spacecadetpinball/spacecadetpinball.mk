################################################################################
#
# spacecadetpinball
#
################################################################################
# Version: Commits on Jul 11, 2023
SPACECADETPINBALL_VERSION = e2f3ae66f83a8f19f479bf697f48a0929125b1e3
SPACECADETPINBALL_SITE = $(call github,k4zmu2a,SpaceCadetPinball,$(SPACECADETPINBALL_VERSION))

SPACECADETPINBALL_DEPENDENCIES = sdl2 sdl2_mixer host-ninja
SPACECADETPINBALL_LICENSE = MIT

SPACECADETPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

SPACECADETPINBALL_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define SPACECADETPINBALL_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(SPACECADETPINBALL_BUILDDIR)
endef

define SPACECADETPINBALL_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/spacecadetpinball
	$(INSTALL) -D $(@D)/bin/SpaceCadetPinball $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/spacecadetpinball/spacecadetpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
