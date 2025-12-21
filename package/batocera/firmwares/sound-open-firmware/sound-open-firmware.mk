################################################################################
#
# sound-open-firmware
#
################################################################################
# Version: Commits on Dec 19, 2025
SOUND_OPEN_FIRMWARE_VERSION = v2025.12
SOUND_OPEN_FIRMWARE_SOURCE = sof-bin-$(subst v,,$(SOUND_OPEN_FIRMWARE_VERSION)).tar.gz
SOUND_OPEN_FIRMWARE_SITE = https://github.com/thesofproject/sof-bin/releases/download/$(SOUND_OPEN_FIRMWARE_VERSION)
SOUND_OPEN_FIRMWARE_LICENSE = BSD-3-Clause
SOUND_OPEN_FIRMWARE_LICENSE_FILES = LICENSE

SOUND_OPEN_FIRMWARE_DEPENDENCIES = alsa-lib alsa-utils alllinuxfirmwares

define SOUND_OPEN_FIRMWARE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/intel
	rsync -arv --force $(@D)/sof* $(TARGET_DIR)/lib/firmware/intel/
endef

$(eval $(generic-package))
