################################################################################
#
# uboot-ps5000
#
################################################################################
# Version: Commits on Sept 13, 2021
UBOOT_PS5000_VERSION = e2c76fb6b0f89c5385273b3a83fbd2ce16903396
UBOOT_PS5000_SITE = $(call github,rk3128-cfw,caesar-u-boot,$(UBOOT_PS5000_VERSION))
UBOOT_PS5000_LICENSE = GPLv2

UBOOT_PS5000_DEPENDENCIES = rk3128-blobs

define UBOOT_PS5000_BUILD_CMDS
	# FIXME: there should be a better way to build
	# Build uboot for wx8-rk3128
	cd $(@D) && ARCH=arm CHIP=rk3128 CROSS_COMPILE=$(HOST_DIR)/bin/arm-buildroot-linux-gnueabihf- make ps5000-rk3128_defconfig
	cd $(@D) && ARCH=arm CHIP=rk3128 CROSS_COMPILE=$(HOST_DIR)/bin/arm-buildroot-linux-gnueabihf- make

	# Generate idbloader.img
	$(@D)/tools/mkimage -n rk3128 -T rksd -d $(BINARIES_DIR)/rkbin/bin/rk31/rk3128_ddr_300MHz_v2.12.bin $(@D)/idbloader.img
	cat $(BINARIES_DIR)/rkbin/bin/rk31/rk3128x_miniloader_v2.57.bin >> $(@D)/idbloader.img

	# Generate uboot.img
	$(@D)/tools/loaderimage --pack --uboot $(@D)/u-boot-dtb.bin $(@D)/uboot.img --size 1024 4

	# Generate trust.img
	$(@D)/tools/loaderimage --pack --trustos $(BINARIES_DIR)/rkbin/bin/rk31/rk3126_tee_ta_v2.01.bin $(@D)/trust.img --size 1024 4
endef

define UBOOT_PS5000_INSTALL_TARGET_CMDS
	cp $(@D)/idbloader.img	$(BINARIES_DIR)/idbloader.img
	cp $(@D)/uboot.img		$(BINARIES_DIR)/uboot-ps5000.img
	cp $(@D)/trust.img		$(BINARIES_DIR)/trust.img
endef

$(eval $(generic-package))
