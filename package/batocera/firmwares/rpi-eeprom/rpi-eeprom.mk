################################################################################
#
# rpi-eeprom
#
################################################################################
# Version: Commits on Sept 30, 2022
RPI_EEPROM_VERSION = 2efe9daef66bbca33f6848a63355febe8681145a
RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
RPI_EEPROM_DEPENDENCIES = rpi-userland-batocera

RPI_EEPROM_LICENSE = BSD-3-Clause

define RPI_EEPROM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/raspberrypi/bootloader/default
	cp -pvr $(@D)/firmware/stable/{pieeprom-2022-09-02.bin,recovery.bin,vl805-000137ad.bin,vl805-000138a1.bin} \
			$(TARGET_DIR)/lib/firmware/raspberrypi/bootloader/default
		cp -pvr $(@D)/rpi-eeprom-{config,digest,update} $(TARGET_DIR)/usr/bin
		cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/arch/rpi-eeprom/batocera-update-rpi4-fw $(TARGET_DIR)/usr/bin
		chmod 754 $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw
endef

$(eval $(generic-package))
