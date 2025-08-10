################################################################################
#
# dmd-simulator
#
################################################################################
# Version: Commits on Aug 04, 2025
DMD_SIMULATOR_VERSION = e313e5929390e37739e3d78eb50aaf73f860ba0a
DMD_SIMULATOR_SITE =  $(call github,batocera-linux,dmd-simulator,$(DMD_SIMULATOR_VERSION))

define DMD_SIMULATOR_INSTALL_DMD_SIMULATOR
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/dmd_simulator/cli/dmd_simulator.py $(TARGET_DIR)/usr/bin/dmd-simulator
endef

define DMD_SIMULATOR_INSTALL_DMD_SIMULATOR_PLAYER
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/dmd_simulator/dmd_player.py $(TARGET_DIR)/usr/bin/dmd-play

	mkdir -p $(TARGET_DIR)/usr/share/dmd-simulator/scripts
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/hardware/dmd-simulator/scripts/*.sh $(TARGET_DIR)/usr/share/dmd-simulator/scripts/

	mkdir -p $(TARGET_DIR)/usr/share/batocera/services
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/hardware/dmd-simulator/dmd_simulator.service $(TARGET_DIR)/usr/share/batocera/services/dmd_simulator

	$(INSTALL) -m 0644 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/hardware/dmd-simulator/batocera.png $(TARGET_DIR)/usr/share/dmd-simulator/images/system/batocera.png
	$(INSTALL) -m 0644 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/hardware/dmd-simulator/rainbow.png  $(TARGET_DIR)/usr/share/dmd-simulator/images/system/rainbow.png
endef

ifeq ($(BR2_PACKAGE_DMD_SIMULATOR),y)
DMD_SIMULATOR_POST_INSTALL_TARGET_HOOKS += DMD_SIMULATOR_INSTALL_DMD_SIMULATOR
endif

ifeq ($(BR2_PACKAGE_DMD_SIMULATOR_PLAYER),y)
DMD_SIMULATOR_POST_INSTALL_TARGET_HOOKS += DMD_SIMULATOR_INSTALL_DMD_SIMULATOR_PLAYER
endif

$(eval $(generic-package))
