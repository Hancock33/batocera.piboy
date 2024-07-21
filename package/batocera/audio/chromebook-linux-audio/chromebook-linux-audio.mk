################################################################################
#
# chromebook-linux-audio
#
################################################################################
# Version: Commits on Jul 17, 2024
CHROMEBOOK_LINUX_AUDIO_VERSION = 26a700ea1a599bb586283e6e720e4da5964b90ac
CHROMEBOOK_LINUX_AUDIO_SITE = $(call github,WeirdTreeThing,chromebook-linux-audio,$(CHROMEBOOK_LINUX_AUDIO_VERSION))
CHROMEBOOK_LINUX_AUDIO_LICENSE = BSD-3-Clause
CHROMEBOOK_LINUX_AUDIO_LICENSE_FILES = LICENSE

# we need the alsa-ucm dependencies first
CHROMEBOOK_LINUX_AUDIO_DEPENDENCIES += alsa-ucm-conf alsa-utils
CHROMEBOOK_LINUX_AUDIO_DEPENDENCIES += alllinuxfirmwares sound-open-firmware
CHROMEBOOK_LINUX_AUDIO_DEPENDENCIES += chromebook-ucm-conf

define CHROMEBOOK_LINUX_AUDIO_INSTALL_TARGET_CMDS
    # AMD firmware
    mkdir -p $(TARGET_DIR)/lib/firmware/amd/sof/community
    mkdir -p $(TARGET_DIR)/lib/firmware/amd/sof-tplg
    rsync -arv $(@D)/conf/amd-sof/fw $(TARGET_DIR)/lib/firmware/amd/sof/community
    rsync -arv $(@D)/conf/amd-sof/tplg $(TARGET_DIR)/lib/firmware/amd/sof-tplg
endef

$(eval $(generic-package))
