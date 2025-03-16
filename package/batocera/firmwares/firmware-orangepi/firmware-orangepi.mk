################################################################################
#
# firmware-orangepi
#
################################################################################
# Version: Commits on Feb 12, 2025
FIRMWARE_ORANGEPI_VERSION = a2f3d19ed516f70f17978647d182dc56b46e01b8
FIRMWARE_ORANGEPI_SITE = $(call github,orangepi-xunlong,firmware,$(FIRMWARE_ORANGEPI_VERSION))

FIRMWARE_ORANGEPI_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

define FIRMWARE_ORANGEPI_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ORANGEPI_TARGET_DIR)
	cp -a $(@D)/* $(FIRMWARE_ORANGEPI_TARGET_DIR)/
endef

$(eval $(generic-package))
