################################################################################
#
# rpi-eeprom
#
################################################################################
# Version: Commits on Oct 15, 2024
RPI_EEPROM_VERSION = f2e314d29442e0b332caa2a26cd156dd3d3e1797
RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
RPI_EEPROM_DEPENDENCIES = rpi-utils

RPI_EEPROM_LICENSE = BSD-3-Clause

RPI_EEPROM_RPI4_VERSION=2024-10-10
RPI_EEPROM_RPI5_VERSION=2024-10-10

RPI_EEPROM_RPI4_FW_DIR=$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader-2711/default
RPI_EEPROM_RPI5_FW_DIR=$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader-2712/default

define RPI_EEPROM_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/rpi-eeprom-{config,digest,update} $(TARGET_DIR)/usr/bin
	#RPI4
	mkdir -p $(RPI_EEPROM_RPI4_FW_DIR)
	cp -pvr $(@D)/firmware-2711/stable/{pieeprom-$(RPI_EEPROM_RPI4_VERSION).bin,recovery.bin,vl805-000137ad.bin,vl805-000138a1.bin,vl805-000138c0.bin} $(RPI_EEPROM_RPI4_FW_DIR)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/rpi-eeprom/batocera-update-rpi4-fw $(TARGET_DIR)/usr/bin
	sed -i "s|1980-01-01|$(RPI_EEPROM_RPI4_VERSION)|" $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw
	chmod 754 $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw

	#RPI5
	mkdir -p $(RPI_EEPROM_RPI5_FW_DIR)
	cp -pvr $(@D)/firmware-2712/stable/{pieeprom-$(RPI_EEPROM_RPI5_VERSION).bin,recovery.bin} $(RPI_EEPROM_RPI5_FW_DIR)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/rpi-eeprom/batocera-update-rpi5-fw $(TARGET_DIR)/usr/bin
	sed -i "s|1980-01-01|$(RPI_EEPROM_RPI5_VERSION)|" $(TARGET_DIR)/usr/bin/batocera-update-rpi5-fw
	chmod 754 $(TARGET_DIR)/usr/bin/batocera-update-rpi5-fw
endef

$(eval $(generic-package))
