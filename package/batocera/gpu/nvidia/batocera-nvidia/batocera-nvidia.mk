################################################################################
#
# batocera-nvidia
#
################################################################################

BATOCERA_NVIDIA_VERSION = 1.5
BATOCERA_NVIDIA_SOURCE =
BATOCERA_NVIDIA_LICENSE = LGPL-3.0+

define BATOCERA_NVIDIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_NVIDIA_PKGDIR)/batocera-nvidia $(TARGET_DIR)/usr/bin/batocera-nvidia
	# [Xorg]
	mkdir -p $(TARGET_DIR)/etc/X11/xorg.conf.d
	ln -sf /userdata/system/99-nvidia.conf                  $(TARGET_DIR)/etc/X11/xorg.conf.d/99-nvidia.conf

	# [Blacklist & Modprobe]
	mkdir -p $(TARGET_DIR)/etc/modprobe.d
	ln -sf /var/run/nvidia/modprobe/blacklist-nouveau.conf  $(TARGET_DIR)/etc/modprobe.d/blacklist-nouveau.conf
	ln -sf /var/run/nvidia/modprobe/nvidia-drm.conf         $(TARGET_DIR)/etc/modprobe.d/nvidia-drm.conf
endef

$(eval $(generic-package))
