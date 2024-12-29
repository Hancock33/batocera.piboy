################################################################################
#
# firmware-armbian
#
################################################################################
# Version: Commits on Nov 07, 2024
FIRMWARE_ARMBIAN_VERSION = 8dbb28d2ee8fa3d5f67a9d9dbc64c3d2b3b0adac
FIRMWARE_ARMBIAN_SITE = $(call github,armbian,firmware,$(FIRMWARE_ARMBIAN_VERSION))

FIRMWARE_ARMBIAN_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

define FIRMWARE_ARMBIAN_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ARMBIAN_TARGET_DIR)
	cp -aRf $(@D)/* $(FIRMWARE_ARMBIAN_TARGET_DIR)/
endef

$(eval $(generic-package))
