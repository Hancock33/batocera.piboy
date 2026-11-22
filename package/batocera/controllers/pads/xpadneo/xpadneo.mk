################################################################################
#
# xpadneo
#
################################################################################
# Version: Commits on Nov 08, 2026
XPADNEO_VERSION = 56b538d951300bf804f6631738603c5eb14c04f0
XPADNEO_SITE = $(call github,atar-axis,xpadneo,$(XPADNEO_VERSION))
XPADNEO_LICENSE = GPL-2.0 (driver), GPL-3.0+ (docs, tools)
XPADNEO_LICENSE_FILES = LICENSE.md LICENSES/LICENSE.gpl-2.0.txt LICENSES/LICENSE.gpl-3.0.txt
XPADNEO_DEPENDENCIES = host-cabextract bluez5_utils
XPADNEO_MODULE_SUBDIRS = hid-xpadneo/src

XPADNEO_MODULE_MAKE_OPTS = \
	KCFLAGS="$$KCFLAGS $(XPADNEO_USER_EXTRA_CFLAGS)"

define XPADNEO_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/etc/udev/rules.d $(@D)/hid-xpadneo/etc-udev-rules.d/*.rules
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/etc/modprobe.d $(@D)/hid-xpadneo/etc-modprobe.d/*.conf
	echo "options bluetooth disable_ertm=1" >> $(TARGET_DIR)/etc/modprobe.d/xpadneo.conf
	echo "options hid_xpadneo disable_shift_mode=1" >> $(TARGET_DIR)/etc/modprobe.d/xpadneo.conf
endef

$(eval $(kernel-module))
$(eval $(generic-package))
