################################################################################
#
# steamdeck-dsp
#
################################################################################
# Version: Commits on Dec 19, 2025
STEAMDECK_DSP_VERSION = 0.83-1
STEAMDECK_DSP_SOURCE =
STEAMDECK_DSP_LICENSE = LGPL-2.1+

STEAMDECK_DSP_DEPENDENCIES = alsa-ucm-conf pipewire sound-open-firmware wireplumber

define STEAMDECK_DSP_INSTALL_TARGET_CMDS
	rsync -a $(STEAMDECK_DSP_PKGDIR)/usr $(TARGET_DIR)/
	rsync -a $(STEAMDECK_DSP_PKGDIR)/lib $(TARGET_DIR)/
endef

$(eval $(generic-package))
