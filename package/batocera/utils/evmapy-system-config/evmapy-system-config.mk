################################################################################
#
# evmapy-system-config
#
################################################################################
EVMAPY_SYSTEM_CONFIG_VERSION = 1
EVMAPY_SYSTEM_CONFIG_SOURCE =

define EVMAPY_SYSTEM_CONFIG_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/evmapy-system-config/mouse.keys $(TARGET_DIR)/usr/share/evmapy/windows_installers.keys

	cp -avr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/evmapy-system-config/keys/* $(TARGET_DIR)/usr/share/evmapy

	@if [ "$(BR2_PACKAGE_XPI_GAMECON_RPI)" = "y" ]; then \
		mkdir $(TARGET_DIR)/usr/share/evmapy/piboy ; \
		cp -avr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/evmapy-system-config/keys.piboy/* $(TARGET_DIR)/usr/share/evmapy/piboy ; fi
endef

$(eval $(generic-package))
