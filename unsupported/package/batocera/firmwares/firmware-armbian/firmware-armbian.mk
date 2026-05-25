################################################################################
#
# firmware-armbian
#
################################################################################
# Version: Commits on Feb 07, 2026
FIRMWARE_ARMBIAN_VERSION = f065f271d492193a472a12103a0604ef4178a5c7
FIRMWARE_ARMBIAN_SITE = https://github.com/armbian/firmware
FIRMWARE_ARMBIAN_SITE_METHOD = git

FIRMWARE_ARMBIAN_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

define FIRMWARE_ARMBIAN_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ARMBIAN_TARGET_DIR)
	rsync -au --checksum --force $(@D)/ $(FIRMWARE_ARMBIAN_TARGET_DIR)/
endef

$(eval $(generic-package))
