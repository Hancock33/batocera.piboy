################################################################################
#
# xpi_gamecon_rpi
#
################################################################################
# Version: Commits on Aug 07, 2022
XPI_GAMECON_RPI_VERSION = f30cea1a30e4e9ad8fcf3b7da48f2770b4ea3368
XPI_GAMECON_RPI_SITE = $(call github,hancock33,piboycontrols,$(XPI_GAMECON_RPI_VERSION))
XPI_GAMECON_RPI_DEPENDENCIES = linux
XPI_GAMECON_RPI_CP_PATH = $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/pads/xpi_gamecon_rpi

define XPI_GAMECON_RPI_INSTALL_TARGET_CMDS
	$(TARGET_CC) -Wno-incompatible-pointer-types $(XPI_GAMECON_RPI_CP_PATH)/volumed.c -o $(TARGET_DIR)/usr/sbin/volumed -L$(STAGING_DIR)/usr/lib -lpulse
	$(INSTALL) -D -m 0755 $(XPI_GAMECON_RPI_CP_PATH)/S19piboy					$(TARGET_DIR)/etc/init.d/S19piboy
	$(INSTALL) -D -m 0755 $(XPI_GAMECON_RPI_CP_PATH)/piboy-dmgcontrol.py		$(TARGET_DIR)/usr/bin/piboy-dmgcontrol.py
	$(INSTALL) -D -m 0755 $(XPI_GAMECON_RPI_CP_PATH)/piboy_powerswitch.rules	$(TARGET_DIR)/etc/udev/rules.d/60-piboy_powerswitch.rules
	$(INSTALL) -D -m 0755 $(XPI_GAMECON_RPI_CP_PATH)/piboy_keys					$(TARGET_DIR)/usr/bin/piboy_keys
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system
	cp -pvr $(XPI_GAMECON_RPI_CP_PATH)/piboy-fan.conf $(TARGET_DIR)/usr/share/batocera/datainit/system
	cp -pvr $(XPI_GAMECON_RPI_CP_PATH)/piboy-led.conf $(TARGET_DIR)/usr/share/batocera/datainit/system
	cp -pvr $(XPI_GAMECON_RPI_CP_PATH)/piboy-power.conf $(TARGET_DIR)/usr/share/batocera/datainit/system
	chmod 754 $(TARGET_DIR)/usr/sbin/volumed
	chmod 754 $(TARGET_DIR)/usr/bin/piboy_keys

	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms
	cp -pvr $(XPI_GAMECON_RPI_CP_PATH)/roms/piboy $(TARGET_DIR)/usr/share/batocera/datainit/roms
endef

$(eval $(generic-package))
