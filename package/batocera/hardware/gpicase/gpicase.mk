################################################################################
#
# gpicase
#
################################################################################

GPICASE_VERSION = 2.1
GPICASE_SOURCE =

define GPICASE_INSTALL_TARGET_CMDS
	mkdir -p $(BINARIES_DIR)/rpi-firmware/overlays
	cp -rf $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/hardware/gpicase/overlays/*			$(BINARIES_DIR)/rpi-firmware/overlays/
	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/hardware/gpicase/99-gpicase.rules		$(TARGET_DIR)/etc/udev/rules.d/
	$(INSTALL) -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/hardware/gpicase/batocera-gpicase-install	$(TARGET_DIR)/usr/bin/batocera-gpicase-install
endef

$(eval $(generic-package))
