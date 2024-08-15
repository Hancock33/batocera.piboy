################################################################################
#
# rpi-eeprom
#
################################################################################
# Version: Commits on Aug 15, 2024
RPI_EEPROM_VERSION = ef2fc67d235d037b2b468813e646e20890fcea07
RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
RPI_EEPROM_DEPENDENCIES = rpi-utils

RPI_EEPROM_LICENSE = BSD-3-Clause

RPI4_EEPROM_VERSION=2024-07-30
RPI5_EEPROM_VERSION=2024-07-30

RPI4_FW_DIR=$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader-2711/default
RPI5_FW_DIR=$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader-2712/default

define RPI_EEPROM_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/rpi-eeprom-{config,digest,update} $(TARGET_DIR)/usr/bin
	#RPI4
	mkdir -p $(RPI4_FW_DIR)
	cp -pvr $(@D)/firmware-2711/stable/{pieeprom-$(RPI4_EEPROM_VERSION).bin,recovery.bin,vl805-000137ad.bin,vl805-000138a1.bin,vl805-000138c0.bin} $(RPI4_FW_DIR)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/rpi-eeprom/batocera-update-rpi4-fw $(TARGET_DIR)/usr/bin
	sed -i "s|1980-01-01|$(RPI4_EEPROM_VERSION)|" $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw
	chmod 754 $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw

	#RPI5
	mkdir -p $(RPI5_FW_DIR)
	cp -pvr $(@D)/firmware-2712/stable/{pieeprom-$(RPI5_EEPROM_VERSION).bin,recovery.bin} $(RPI5_FW_DIR)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/rpi-eeprom/batocera-update-rpi5-fw $(TARGET_DIR)/usr/bin
	sed -i "s|1980-01-01|$(RPI5_EEPROM_VERSION)|" $(TARGET_DIR)/usr/bin/batocera-update-rpi5-fw
	chmod 754 $(TARGET_DIR)/usr/bin/batocera-update-rpi5-fw
endef

$(eval $(generic-package))
