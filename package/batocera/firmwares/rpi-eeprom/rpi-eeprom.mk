################################################################################
#
# rpi-eeprom
#
################################################################################
# Version: Commits on Feb 02, 2026
RPI_EEPROM_VERSION = ca9846f78441e676e4ec081727e5cce646a2fe18
RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
RPI_EEPROM_DEPENDENCIES = rpi-utils

RPI_EEPROM_LICENSE = BSD-3-Clause

RPI_EEPROM_RPI4_VERSION=2026-01-09
RPI_EEPROM_RPI5_VERSION=2026-01-21

RPI_EEPROM_RPI4_FW_DIR=$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader-2711/default
RPI_EEPROM_RPI5_FW_DIR=$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader-2712/default

define RPI_EEPROM_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/rpi-eeprom-{config,digest,update} $(TARGET_DIR)/usr/bin
	#RPI4
	mkdir -p $(RPI_EEPROM_RPI4_FW_DIR)
	cp -pvr $(@D)/firmware-2711/stable/{pieeprom-$(RPI_EEPROM_RPI4_VERSION).bin,recovery.bin,vl805-000138c0.bin} $(RPI_EEPROM_RPI4_FW_DIR)
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
