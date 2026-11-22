################################################################################
#
# wii-u-gc-adapter
#
################################################################################
# Version: Commits on Sept 06, 2021
WII_U_GC_ADAPTER_VERSION = fa098efa7f6b34f8cd82e2c249c81c629901976c
WII_U_GC_ADAPTER_SITE = $(call github,ToadKing,wii-u-gc-adapter,$(WII_U_GC_ADAPTER_VERSION))
WII_U_GC_ADAPTER_LICENSE = MIT
WII_U_GC_ADAPTER_LICENSE_FILES = LICENSE

WII_U_GC_ADAPTER_DEPENDENCIES = udev libusb ncurses

define WII_U_GC_ADAPTER_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" -C $(@D)
endef

define WII_U_GC_ADAPTER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/wii-u-gc-adapter $(TARGET_DIR)/usr/bin/wii-u-gc-adapter
	$(INSTALL) -D -m 0755 $(WII_U_GC_ADAPTER_PKGDIR)/wii-u-gc-adapter-daemon $(TARGET_DIR)/usr/bin/wii-u-gc-adapter-daemon
	$(INSTALL) -D -m 0644 $(WII_U_GC_ADAPTER_PKGDIR)/99-wii-u-gc-adapter.rules $(TARGET_DIR)/etc/udev/rules.d/99-wii-u-gc-adapter.rules
endef

$(eval $(generic-package))
