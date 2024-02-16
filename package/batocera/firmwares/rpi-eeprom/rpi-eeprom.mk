################################################################################
#
# rpi-eeprom
#
################################################################################
# Version: Commits on Feb 16, 2024
RPI_EEPROM_VERSION = b1a715b256bd1a74c53288ecefe1dcf2c9393f9a
RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
RPI_EEPROM_DEPENDENCIES = rpi-userland-batocera

RPI_EEPROM_LICENSE = BSD-3-Clause

RPI4_EEPROM_VERSION=2024-01-18
RPI5_EEPROM_VERSION=2024-02-16

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
