################################################################################
#
# batocera-udev-rules
#
################################################################################

BATOCERA_UDEV_RULES_VERSION = 1.0
BATOCERA_UDEV_RULES_LICENSE = GPL
BATOCERA_UDEV_RULES_SOURCE =

define BATOCERA_UDEV_RULES_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/etc/udev/rules.d $(BATOCERA_UDEV_RULES_PKGDIR)/rules/*.rules
	$(INSTALL) -D -m 0755 $(BATOCERA_UDEV_RULES_PKGDIR)/S15virtualevents $(TARGET_DIR)/etc/init.d/S15virtualevents
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/lib/udev/hwdb.d $(BATOCERA_UDEV_RULES_PKGDIR)/hwdb/*.hwdb
	mkdir -p $(TARGET_DIR)/etc/usb_modeswitch.d
	# generate these files cause windows doesn't support file with ':' in git easily
	(echo "# Logitech G920 Racing Wheel"; echo "DefaultVendor=046d"; echo "DefaultProduct=c261"; echo "MessageEndpoint=01"; echo "ResponseEndpoint=01"; echo "TargetClass=0x03"; echo 'MessageContent="0f00010142"') > $(TARGET_DIR)/etc/usb_modeswitch.d/046d:c261
	(echo "# Logitech G923 Racing Wheel"; echo "DefaultVendor=046d"; echo "DefaultProduct=c26d"; echo "MessageEndpoint=01"; echo "ResponseEndpoint=01"; echo "TargetClass=0x03"; echo 'MessageContent="0f00010142"') > $(TARGET_DIR)/etc/usb_modeswitch.d/046d:c26d

endef

$(eval $(generic-package))
