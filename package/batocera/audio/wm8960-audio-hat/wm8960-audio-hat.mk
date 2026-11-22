################################################################################
#
# wm8960-audio-hat
#
################################################################################
# Version: Commits on Oct 15, 2026
WM8960_AUDIO_HAT_VERSION = d4915ac97730e78e43f985dabcf3903e85eb8b0a
WM8960_AUDIO_HAT_SITE = $(call github,waveshareteam,WM8960-Audio-HAT,$(WM8960_AUDIO_HAT_VERSION))
WM8960_AUDIO_HAT_LICENSE = GPL-3.0
WM8960_AUDIO_HAT_LICENSE_FILES = LICENSE
WM8960_AUDIO_HAT_DEPENDENCIES = alsa-lib rpi-utils

define WM8960_AUDIO_HAT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/etc/wm8960-soundcard $(@D)/asound.conf $(@D)/wm8960_asound.state
	$(INSTALL) -D -m 0755 $(@D)/wm8960-soundcard $(TARGET_DIR)/usr/bin/wm8960-soundcard
	# add our init.d script
	$(INSTALL) -D -m 0755 $(WM8960_AUDIO_HAT_PKGDIR)/S12wm8960 $(TARGET_DIR)/etc/init.d/S12wm8960
endef

$(eval $(generic-package))
