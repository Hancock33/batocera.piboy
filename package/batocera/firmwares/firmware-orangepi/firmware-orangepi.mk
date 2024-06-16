################################################################################
#
# firmware-orangepi
#
################################################################################
# Version: Commits on Jan 24, 2024
FIRMWARE_ORANGEPI_VERSION = 76ead17a1770459560042a9a7c43fe615bbce5e7
FIRMWARE_ORANGEPI_SITE = $(call github,orangepi-xunlong,firmware,$(FIRMWARE_ORANGEPI_VERSION))

FIRMWARE_ORANGEPI_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

define FIRMWARE_ORANGEPI_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ORANGEPI_TARGET_DIR)
	cp -a $(@D)/* $(FIRMWARE_ORANGEPI_TARGET_DIR)/
endef

$(eval $(generic-package))
