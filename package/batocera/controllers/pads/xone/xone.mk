################################################################################
#
# xone
#
################################################################################
# Version: Commits on Oct 18, 2025
XONE_VERSION = 3ec5e6d5c6f88188f354b243a19035817d4088fc
XONE_SITE = $(call github,dlundqvist,xone,$(XONE_VERSION))
XONE_DEPENDENCIES = host-cabextract libusb

define XONE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/install/modprobe.conf $(TARGET_DIR)/etc/modprobe.d/xone-blacklist.conf
	# copy firmware
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/pads/xone/FW_ACC_00U.bin \
	$(TARGET_DIR)/lib/firmware/xow_dongle.bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
