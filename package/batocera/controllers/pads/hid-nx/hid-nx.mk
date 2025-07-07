################################################################################
#
# hid-nx
#
################################################################################
# Version: Commits on Jul 06, 2025
HID_NX_VERSION = e225fe1985710ca9ff820df886343e10a4891653
HID_NX_SITE = $(call github,emilyst,hid-nx-dkms,$(HID_NX_VERSION))
HID_NX_DEPENDENCIES = host-cabextract libusb

define HID_NX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
	cp -v $(@D)/99-joycond-ignore.rules $(TARGET_DIR)/etc/udev/rules.d/
	# blacklist hid-nintendo
	mkdir -p $(TARGET_DIR)/etc/modprobe.d
	echo "blacklist hid-nintendo" > $(TARGET_DIR)/etc/modprobe.d/hid-nintendo.conf
endef

$(eval $(kernel-module))
$(eval $(generic-package))
