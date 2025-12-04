################################################################################
#
# xone
#
################################################################################
# Version: Commits on Dec 04, 2025
XONE_VERSION = 4914929b5fd236445c46de27a43f278894a8cb81
XONE_SITE = $(call github,dlundqvist,xone,$(XONE_VERSION))
XONE_DEPENDENCIES = host-cabextract libusb

define XONE_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0644 $(@D)/install/modprobe.conf \
    $(TARGET_DIR)/etc/modprobe.d/xone-blacklist.conf
# copy firmware
cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/pads/xone/FW_ACC_00U.bin \
    $(TARGET_DIR)/lib/firmware/xow_dongle.bin
# create symbolic link
ln -sf /lib/firmware/xow_dongle.bin \
    $(TARGET_DIR)/lib/firmware/xow_dongle_045e_02e6.bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
