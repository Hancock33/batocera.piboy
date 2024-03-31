################################################################################
#
# xone
#
################################################################################
# Version: Commits on Mar 29, 2024
XONE_VERSION = 12074ae20e8d4d2e35940f9de9688c150eeaa90c
XONE_SITE = $(call github,medusalix,xone,$(XONE_VERSION))
XONE_DEPENDENCIES = host-cabextract libusb

define XONE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/install/modprobe.conf $(TARGET_DIR)/etc/modprobe.d/xone-blacklist.conf
	# copy firmware
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xone/FW_ACC_00U.bin \
	$(TARGET_DIR)/lib/firmware/xow_dongle.bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
