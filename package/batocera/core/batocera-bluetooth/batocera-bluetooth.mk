################################################################################
#
# batocera-bluetooth
#
################################################################################

BATOCERA_BLUETOOTH_VERSION = 2.5
BATOCERA_BLUETOOTH_LICENSE = GPL
BATOCERA_BLUETOOTH_SOURCE =

BATOCERA_BLUETOOTH_STACK =

# tinkerboard only ??
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3288),y)
BATOCERA_BLUETOOTH_STACK = rfkreset rtk115
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3399),y)
BATOCERA_BLUETOOTH_STACK = rfkreset bcm150
else ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_H6)$(BR2_PACKAGE_BATOCERA_TARGET_H616),)
BATOCERA_BLUETOOTH_STACK = rfkreset sprd
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_A3GEN2),y)
BATOCERA_BLUETOOTH_STACK = kvim4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_T527),y)
BATOCERA_BLUETOOTH_STACK = bcm4345c5
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3568),y)
BATOCERA_BLUETOOTH_STACK = bcm4345c0
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588_MAINLINE),y)
BATOCERA_BLUETOOTH_STACK = aic8800
endif
define BATOCERA_BLUETOOTH_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_BLUETOOTH_PKGDIR)/S29namebluetooth $(TARGET_DIR)/etc/init.d/S29namebluetooth
	$(INSTALL) -D -m 0755 $(BATOCERA_BLUETOOTH_PKGDIR)/S32bluetooth.template $(TARGET_DIR)/etc/init.d/S32bluetooth
	$(SED) 's+@INTERNAL_BLUETOOTH_STACK@+$(BATOCERA_BLUETOOTH_STACK)+' $(TARGET_DIR)/etc/init.d/S32bluetooth
endef

$(eval $(generic-package))
