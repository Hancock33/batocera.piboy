################################################################################
#
# rpi-eeprom
#
################################################################################
# Version: Commits on May 11, 2023
RPI_EEPROM_VERSION = 43477c6a91773a7dc31c360662a919757cf4e606
RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
RPI_EEPROM_DEPENDENCIES = rpi-userland-batocera

RPI_EEPROM_LICENSE = BSD-3-Clause
EEPROM_VERSION=2023-01-11
define RPI_EEPROM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/raspberrypi/bootloader/default
	cp -pvr $(@D)/firmware/stable/{pieeprom-$(EEPROM_VERSION).bin,recovery.bin,vl805-000137ad.bin,vl805-000138a1.bin,vl805-000138c0.bin} \
			$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader/default
	cp -pvr $(@D)/rpi-eeprom-{config,digest,update} $(TARGET_DIR)/usr/bin
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/rpi-eeprom/batocera-update-rpi4-fw $(TARGET_DIR)/usr/bin
	sed -i "s|1980-01-01|$(EEPROM_VERSION)|" $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw
	chmod 754 $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw
endef

$(eval $(generic-package))
