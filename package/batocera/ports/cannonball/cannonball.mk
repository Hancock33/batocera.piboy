################################################################################
#
# cannonball
#
################################################################################
# Version: Commits on Jan 30, 2022
CANNONBALL_VERSION = 27493ebf62be3498dff93ed6a45e8e2db819bae1
CANNONBALL_SITE = $(call github,djyt,cannonball,$(CANNONBALL_VERSION))
CANNONBALL_LICENSE = GPL-2.0
CANNONBALL_EMULATOR_INFO = cannonball.emulator.yml
CANNONBALL_DEPENDENCIES = sdl2 boost
CANNONBALL_SUPPORTS_IN_SOURCE_BUILD = NO
CANNONBALL_SUBDIR = cmake

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    CANNONBALL_TARGET = pi4-opengles.cmake
else
    CANNONBALL_TARGET = linux.cmake
endif

# Build as release with proper target and paths
CANNONBALL_CONF_OPTS += -DTARGET=$(CANNONBALL_TARGET)

define CANNONBALL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/cmake/buildroot-build/cannonball $(TARGET_DIR)/usr/bin/cannonball
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/cannonball/res
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/cannonball \
		$(@D)/cmake/buildroot-build/res/tilemap.bin \
		$(@D)/cmake/buildroot-build/res/tilepatch.bin
	$(INSTALL) -m 0644 -D $(@D)/cmake/buildroot-build/config.xml $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/cannonball/config_help.txt
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
