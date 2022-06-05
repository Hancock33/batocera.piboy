################################################################################
#
# EVMAPY_SYSTEM_CONFIG
#
################################################################################
EVMAPY_SYSTEM_CONFIG_VERSION = 1
EVMAPY_SYSTEM_CONFIG_SOURCE =


define EVMAPY_SYSTEM_CONFIG_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/evmapy-system-config/hotkey.keys $(TARGET_DIR)/usr/share/evmapy/windows.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/evmapy-system-config/mouse.keys $(TARGET_DIR)/usr/share/evmapy/windows_installers.keys
	
	@if [ "$(BR2_PACKAGE_XPI_GAMECON_RPI4)" = "y" ]; then \
		mkdir $(TARGET_DIR)/usr/share/evmapy/piboy ;
	    cp -avr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/evmapy/keys.piboy/* $(TARGET_DIR)/usr/share/evmapy/piboy ; fi
endef

$(eval $(generic-package))
