################################################################################
#
# XPI_GAMECON_RPI4
#
################################################################################
# Version: Commits on Apr 10, 2022
XPI_GAMECON_RPI4_VERSION = 664d701bae148f6d142ae2524a064fff9ea4e511
XPI_GAMECON_RPI4_SITE = $(call github,hancock33,piboycontrols,$(XPI_GAMECON_RPI4_VERSION))
XPI_GAMECON_RPI4_DEPENDENCIES = linux

define XPI_GAMECON_RPI4_BUILD_CMDS
        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) KVERSION=$(LINUX_DIR)
endef

define XPI_GAMECON_RPI4_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/S19piboy             	$(TARGET_DIR)/etc/init.d/S19piboy
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_fan_ctrl.py		$(TARGET_DIR)/usr/bin/piboy_fan_ctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_aud_ctrl.py		$(TARGET_DIR)/usr/bin/piboy_aud_ctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/piboy_power_ctrl.py 	$(TARGET_DIR)/usr/bin/piboy_power_ctrl.py
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/roms/piboy $(TARGET_DIR)/usr/share/batocera/datainit/roms
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xpi_gamecon_rpi4/kodi.keys $(TARGET_DIR)/usr/share/evmapy/kodi.keys
endef

$(eval $(kernel-module))
$(eval $(generic-package))
