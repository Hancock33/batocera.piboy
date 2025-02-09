################################################################################
#
# firmware-armbian
#
################################################################################
# Version: Commits on Nov 26, 2024
FIRMWARE_ARMBIAN_VERSION = 9179a9f05c31505e1bbc90ffb2bfa563e499bfef
FIRMWARE_ARMBIAN_SITE = $(call github,armbian,firmware,$(FIRMWARE_ARMBIAN_VERSION))

FIRMWARE_ARMBIAN_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

define FIRMWARE_ARMBIAN_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ARMBIAN_TARGET_DIR)
	cp -aRf $(@D)/* $(FIRMWARE_ARMBIAN_TARGET_DIR)/
endef

$(eval $(generic-package))
