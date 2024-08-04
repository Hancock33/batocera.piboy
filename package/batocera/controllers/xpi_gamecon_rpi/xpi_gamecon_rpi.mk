################################################################################
#
# xpi_gamecon_rpi
#
################################################################################
# Version: Commits on Aug 07, 2022
XPI_GAMECON_RPI_VERSION = f30cea1a30e4e9ad8fcf3b7da48f2770b4ea3368
XPI_GAMECON_RPI_SITE = $(call github,hancock33,piboycontrols,$(XPI_GAMECON_RPI_VERSION))
XPI_GAMECON_RPI_DEPENDENCIES = linux batocera-es-piboy

define XPI_GAMECON_RPI_INSTALL_TARGET_CMDS
	$(TARGET_CC) -Wno-incompatible-pointer-types $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi/volumed.c -o $(TARGET_DIR)/usr/sbin/volumed -L$(STAGING_DIR)/usr/lib -lpulse
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi/S19piboy					$(TARGET_DIR)/etc/init.d/S19piboy
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi/piboy_fan_power_ctrl.py	$(TARGET_DIR)/usr/bin/piboy_fan_power_ctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi/piboy_audctrl.py			$(TARGET_DIR)/usr/bin/piboy_audctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi/piboy_powerswitch.rules	$(TARGET_DIR)/etc/udev/rules.d/60-piboy_powerswitch.rules
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi/piboy_keys					$(TARGET_DIR)/usr/bin/piboy_keys
	chmod 754 $(TARGET_DIR)/usr/sbin/volumed
	chmod 754 $(TARGET_DIR)/usr/bin/piboy_keys

	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi/roms/piboy $(TARGET_DIR)/usr/share/batocera/datainit/roms
endef

$(eval $(generic-package))
