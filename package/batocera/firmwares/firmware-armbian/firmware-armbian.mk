################################################################################
#
# firmware-armbian
#
################################################################################
# Version: Commits on Sept 10, 2026
FIRMWARE_ARMBIAN_VERSION = 2a9e1c19460401443267926181191d57e3ff175d
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
