################################################################################
#
# firmware-armbian
#
################################################################################
# Version: Commits on Jun 02, 2024
FIRMWARE_ARMBIAN_VERSION = 9d27a0dae0aa55caa1ac71525d19d4e9dad53330
FIRMWARE_ARMBIAN_SITE = $(call github,armbian,firmware,$(FIRMWARE_ARMBIAN_VERSION))

FIRMWARE_ARMBIAN_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

define FIRMWARE_ARMBIAN_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ARMBIAN_TARGET_DIR)
	cp -aRf $(@D)/* $(FIRMWARE_ARMBIAN_TARGET_DIR)/
endef

$(eval $(generic-package))
