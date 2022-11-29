################################################################################
#
# rpi-eeprom
#
################################################################################
# Version: Commits on Nov 28, 2022
RPI_EEPROM_VERSION = b9fcc9dc72a9f5a21928acb45a324cd34e7125e6
RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
RPI_EEPROM_DEPENDENCIES = rpi-userland-batocera

RPI_EEPROM_LICENSE = BSD-3-Clause

define RPI_EEPROM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/raspberrypi/bootloader/default
	cp -pvr $(@D)/firmware/stable/{pieeprom-2022-11-25.bin,recovery.bin,vl805-000137ad.bin,vl805-000138a1.bin} \
			$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader/default
	cp -pvr $(@D)/rpi-eeprom-{config,digest,update} $(TARGET_DIR)/usr/bin
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/rpi-eeprom/batocera-update-rpi4-fw $(TARGET_DIR)/usr/bin
	chmod 754 $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw
endef

$(eval $(generic-package))
