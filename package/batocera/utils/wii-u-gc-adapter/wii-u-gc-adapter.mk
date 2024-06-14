################################################################################
#
# wii-u-gc-adapter
#
################################################################################
# Version: Commits on Sept 06, 2021
WII_U_GC_ADAPTER_VERSION = fa098efa7f6b34f8cd82e2c249c81c629901976c
WII_U_GC_ADAPTER_SITE = $(call github,ToadKing,wii-u-gc-adapter,$(WII_U_GC_ADAPTER_VERSION))

WII_U_GC_ADAPTER_DEPENDENCIES = udev libusb ncurses

define WII_U_GC_ADAPTER_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" -C  $(@D)
endef

define WII_U_GC_ADAPTER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/wii-u-gc-adapter $(TARGET_DIR)/usr/bin/wii-u-gc-adapter
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/wii-u-gc-adapter/wii-u-gc-adapter-daemon $(TARGET_DIR)/usr/bin/wii-u-gc-adapter-daemon
	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/wii-u-gc-adapter/99-wii-u-gc-adapter.rules $(TARGET_DIR)/etc/udev/rules.d
endef

$(eval $(generic-package))
