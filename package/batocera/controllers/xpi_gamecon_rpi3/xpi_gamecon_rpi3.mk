################################################################################
#
# xpi_gamecon_rpi3
#
################################################################################
# Version: Commits on Aug 07, 2022
XPI_GAMECON_RPI3_VERSION = f30cea1a30e4e9ad8fcf3b7da48f2770b4ea3368
XPI_GAMECON_RPI3_SITE = $(call github,hancock33,piboycontrols,$(XPI_GAMECON_RPI3_VERSION))
XPI_GAMECON_RPI3_DEPENDENCIES = linux

#define XPI_GAMECON_RPI3_BUILD_CMDS
#        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) KVERSION=$(LINUX_DIR)
#endef

define XPI_GAMECON_RPI3_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/S19piboy             	$(TARGET_DIR)/etc/init.d/S19piboy
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_fan_ctrl.py		$(TARGET_DIR)/usr/bin/piboy_fan_ctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_aud_ctrl.py		$(TARGET_DIR)/usr/bin/piboy_aud_ctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_power_ctrl.py 	$(TARGET_DIR)/usr/bin/piboy_power_ctrl.py
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/roms/piboy $(TARGET_DIR)/usr/share/batocera/datainit/roms
endef

#$(eval $(kernel-module))
$(eval $(generic-package))
