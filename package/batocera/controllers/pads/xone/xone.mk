################################################################################
#
# xone
#
################################################################################
# Version: Commits on Jan 11, 2026
XONE_VERSION = e34350de2d518498edff4b689ce153b337809b9f
XONE_SITE = $(call github,dlundqvist,xone,$(XONE_VERSION))
XONE_DEPENDENCIES = host-cabextract libusb

define XONE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/install/modprobe.conf $(TARGET_DIR)/etc/modprobe.d/xone-blacklist.conf
	# copy firmware
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/pads/xone/FW_ACC_00U.bin $(TARGET_DIR)/lib/firmware/xow_dongle.bin
	# create symbolic link
	ln -sf /lib/firmware/xow_dongle.bin $(TARGET_DIR)/lib/firmware/xow_dongle_045e_02e6.bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
