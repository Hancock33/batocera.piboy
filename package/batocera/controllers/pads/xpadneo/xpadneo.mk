################################################################################
#
# xpadneo
#
################################################################################
# Version: Commits on Dec 27, 2025
XPADNEO_VERSION = 02eb9ec372bc49a267ef32f5808d03362490eb2a
XPADNEO_SITE = $(call github,atar-axis,xpadneo,$(XPADNEO_VERSION))
XPADNEO_DEPENDENCIES = host-cabextract bluez5_utils
XPADNEO_MODULE_SUBDIRS = hid-xpadneo/src

XPADNEO_MODULE_MAKE_OPTS = \
	KCFLAGS="$$KCFLAGS $(XPADNEO_USER_EXTRA_CFLAGS)"

define XPADNEO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/etc/udev/rules.d/
	mkdir -p $(TARGET_DIR)/etc/modprobe.d/
	cp -v $(@D)/hid-xpadneo/etc-udev-rules.d/*.rules $(TARGET_DIR)/etc/udev/rules.d/
	cp -v $(@D)/hid-xpadneo/etc-modprobe.d/*.conf $(TARGET_DIR)/etc/modprobe.d/
	echo "options bluetooth disable_ertm=1" >> $(TARGET_DIR)/etc/modprobe.d/xpadneo.conf
	echo "options hid_xpadneo disable_shift_mode=1" >> $(TARGET_DIR)/etc/modprobe.d/xpadneo.conf
endef

$(eval $(kernel-module))
$(eval $(generic-package))
