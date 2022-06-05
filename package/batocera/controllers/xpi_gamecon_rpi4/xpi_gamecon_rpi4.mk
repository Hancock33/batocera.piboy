################################################################################
#
# XPI_GAMECON_RPI4
#
################################################################################
# Version: Commits on May 03, 2022
XPI_GAMECON_RPI4_VERSION = 690024c98cac98606611a5de74a2b124490408e5
XPI_GAMECON_RPI4_SITE = $(call github,hancock33,piboycontrols,$(XPI_GAMECON_RPI4_VERSION))
XPI_GAMECON_RPI4_DEPENDENCIES = linux pulseaudio-utils

define XPI_GAMECON_RPI4_BUILD_CMDS
        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) KVERSION=$(LINUX_DIR)
endef

define XPI_GAMECON_RPI4_INSTALL_TARGET_CMDS
    $(TARGET_CC) $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/volumed.c -o $(TARGET_DIR)/usr/sbin/volumed -L$(STAGING_DIR)/usr/lib -lpulse
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/S19piboy             	  $(TARGET_DIR)/etc/init.d/S19piboy
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_fan_power_ctrl.py $(TARGET_DIR)/usr/bin/piboy_fan_power_ctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_powerswitch.rules $(TARGET_DIR)/etc/udev/rules.d/60-piboy_powerswitch.rules
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_keys              $(TARGET_DIR)/usr/bin/piboy_keys
    chmod 754 $(TARGET_DIR)/usr/sbin/volumed
    chmod 754 $(TARGET_DIR)/usr/bin/piboy_keys

	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/roms/piboy $(TARGET_DIR)/usr/share/batocera/datainit/roms
endef

$(eval $(kernel-module))
$(eval $(generic-package))
