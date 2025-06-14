################################################################################
#
# uboot-orangepi-5-max
#
################################################################################
# Commits on May 14, 2025
UBOOT_ORANGEPI_5_MAX_VERSION = 1.0.0
UBOOT_ORANGEPI_5_MAX_SOURCE =

define UBOOT_ORANGEPI_5_MAX_BUILD_CMDS
endef

define UBOOT_ORANGEPI_5_MAX_INSTALL_TARGET_CMDS
	mkdir -p $(BINARIES_DIR)/uboot-orangepi-5-max
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/boot/uboot-orangepi-5-max/idbloader.img    $(BINARIES_DIR)/uboot-orangepi-5-max/idbloader.img
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/boot/uboot-orangepi-5-max/u-boot.itb       $(BINARIES_DIR)/uboot-orangepi-5-max/u-boot.itb
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/boot/uboot-orangepi-5-max/rkspi_loader.img $(BINARIES_DIR)/uboot-orangepi-5-max/rkspi_loader.img
endef

$(eval $(generic-package))
