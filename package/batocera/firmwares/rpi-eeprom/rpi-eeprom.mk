################################################################################
#
# rpi-eeprom
#
################################################################################
# Version: Commits on Nov 23, 2026
RPI_EEPROM_VERSION = 53859f6a77ca7ec8bfeeb99d1cfe4b66213d2604
RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
RPI_EEPROM_DEPENDENCIES = rpi-utils

RPI_EEPROM_LICENSE = BSD-3-Clause

RPI_EEPROM_RPI4_VERSION = 2026-11-17
RPI_EEPROM_RPI5_VERSION = 2026-11-16

RPI_EEPROM_RPI4_FW_DIR = $(TARGET_DIR)/lib/firmware/raspberrypi/bootloader-2711/default
RPI_EEPROM_RPI5_FW_DIR = $(TARGET_DIR)/lib/firmware/raspberrypi/bootloader-2712/default

define RPI_EEPROM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/bin $(@D)/rpi-eeprom-config $(@D)/rpi-eeprom-digest $(@D)/rpi-eeprom-update
	#RPI4
	rm -rf $(RPI_EEPROM_RPI4_FW_DIR)
	$(INSTALL) -D -m 0644 -t $(RPI_EEPROM_RPI4_FW_DIR) $(@D)/firmware-2711/stable/pieeprom-$(RPI_EEPROM_RPI4_VERSION).bin $(@D)/firmware-2711/stable/recovery.bin $(@D)/firmware-2711/stable/vl805-000138c0.bin
	$(INSTALL) -D -m 0754 $(RPI_EEPROM_PKGDIR)/batocera-update-rpi4-fw $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw
	$(SED) "s|1980-01-01|$(RPI_EEPROM_RPI4_VERSION)|" $(TARGET_DIR)/usr/bin/batocera-update-rpi4-fw
	#RPI5
	rm -rf $(RPI_EEPROM_RPI5_FW_DIR)
	$(INSTALL) -D -m 0644 -t $(RPI_EEPROM_RPI5_FW_DIR) $(@D)/firmware-2712/stable/pieeprom-$(RPI_EEPROM_RPI5_VERSION).bin $(@D)/firmware-2712/stable/recovery.bin
	$(INSTALL) -D -m 0754 $(RPI_EEPROM_PKGDIR)/batocera-update-rpi5-fw $(TARGET_DIR)/usr/bin/batocera-update-rpi5-fw
	$(SED) "s|1980-01-01|$(RPI_EEPROM_RPI5_VERSION)|" $(TARGET_DIR)/usr/bin/batocera-update-rpi5-fw
endef

$(eval $(generic-package))
