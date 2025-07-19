################################################################################
#
# firmware-armbian
#
################################################################################
# Version: Commits on Mar 19, 2025
FIRMWARE_ARMBIAN_VERSION = 4050e02da2dce2b74c97101f7964ecfb962f5aec
FIRMWARE_ARMBIAN_SITE = $(call github,armbian,firmware,$(FIRMWARE_ARMBIAN_VERSION))

FIRMWARE_ARMBIAN_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

define FIRMWARE_ARMBIAN_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ARMBIAN_TARGET_DIR)
	rsync -au --checksum --force $(@D)/ $(FIRMWARE_ARMBIAN_TARGET_DIR)/
endef

$(eval $(generic-package))
