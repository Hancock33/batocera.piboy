################################################################################
#
# chromebook-linux-audio
#
################################################################################
# Version: Commits on Jul 20, 2025
CHROMEBOOK_LINUX_AUDIO_VERSION = 51992dd6f651d6126427bfde398f7c3c86affc75
CHROMEBOOK_LINUX_AUDIO_SITE = $(call github,WeirdTreeThing,chromebook-linux-audio,$(CHROMEBOOK_LINUX_AUDIO_VERSION))
CHROMEBOOK_LINUX_AUDIO_LICENSE = BSD-3-Clause
CHROMEBOOK_LINUX_AUDIO_LICENSE_FILES = LICENSE

# we need the alsa-ucm dependencies first
CHROMEBOOK_LINUX_AUDIO_DEPENDENCIES += alllinuxfirmwares alsa-ucm-conf alsa-utils chromebook-ucm-conf sound-open-firmware

define CHROMEBOOK_LINUX_AUDIO_INSTALL_TARGET_CMDS
	# AMD firmware
	mkdir -p $(TARGET_DIR)/lib/firmware/amd/sof/community
	mkdir -p $(TARGET_DIR)/lib/firmware/amd/sof-tplg
	rsync -arv $(@D)/blobs/mdn/fw   $(TARGET_DIR)/lib/firmware/amd/sof/community
	rsync -arv $(@D)/blobs/mdn/tplg $(TARGET_DIR)/lib/firmware/amd/sof-tplg
	# Wireplumber configs
	mkdir -p $(TARGET_DIR)/etc/wireplumber/wireplumber.conf.d
	cp -f $(@D)/conf/common/51-increase-headroom.conf $(TARGET_DIR)/etc/wireplumber/wireplumber.conf.d/51-increase-headroom.conf
endef

$(eval $(generic-package))
