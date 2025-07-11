################################################################################
#
# wm8960-audio-hat
#
################################################################################
# Version: Commits on Jul 11, 2025
WM8960_AUDIO_HAT_VERSION = bf5a58a7dcab9c346a42b3cde7061c3878ce5508
WM8960_AUDIO_HAT_SITE = $(call github,waveshareteam,WM8960-Audio-HAT,$(WM8960_AUDIO_HAT_VERSION))
WM8960_AUDIO_HAT_LICENSE = GPL-3.0
WM8960_AUDIO_HAT_LICENSE_FILES = LICENSE
WM8960_AUDIO_HAT_DEPENDENCIES = alsa-lib rpi-utils

WM8960_AUDIO_HAT_PATH = $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/audio/wm8960-audio-hat

define WM8960_AUDIO_HAT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/etc/wm8960-soundcard
	cp $(@D)/asound.conf $(TARGET_DIR)/etc/wm8960-soundcard
	cp $(@D)/wm8960_asound.state $(TARGET_DIR)/etc/wm8960-soundcard
	$(INSTALL) -m 755 $(@D)/wm8960-soundcard $(TARGET_DIR)/usr/bin/
	# add our init.d script
	mkdir -p $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 755 $(WM8960_AUDIO_HAT_PATH)/S12wm8960 $(TARGET_DIR)/etc/init.d/S12wm8960
endef

$(eval $(generic-package))
