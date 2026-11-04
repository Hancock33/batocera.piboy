################################################################################
#
# firmware-armbian
#
################################################################################
# Version: Commits on Nov 04, 2026
FIRMWARE_ARMBIAN_VERSION = 16036fb95e3b49d6dc2132811d757d0aa3934db9
FIRMWARE_ARMBIAN_SITE = https://github.com/armbian/firmware
FIRMWARE_ARMBIAN_SITE_METHOD = git

FIRMWARE_ARMBIAN_TARGET_DIR=$(TARGET_DIR)/lib/firmware/

FIRMWARE_ARMBIAN_FILES = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_ARMBIAN_FILES))

ifneq ($(FIRMWARE_ARMBIAN_FILES),)
define FIRMWARE_ARMBIAN_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ARMBIAN_TARGET_DIR)
	cd $(@D) && rsync -a --relative $(FIRMWARE_ARMBIAN_FILES) $(FIRMWARE_ARMBIAN_TARGET_DIR)
endef
else
define FIRMWARE_ARMBIAN_INSTALL_TARGET_CMDS
	mkdir -p $(FIRMWARE_ARMBIAN_TARGET_DIR)
	rsync -au --checksum --force $(@D)/ $(FIRMWARE_ARMBIAN_TARGET_DIR)/
endef
endif

$(eval $(generic-package))
