################################################################################
#
# xone
#
################################################################################
# Version: Commits on Feb 11, 2024
XONE_VERSION = 238840183c6d5bcbb3cba128571ec5a361a9c6bc
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
