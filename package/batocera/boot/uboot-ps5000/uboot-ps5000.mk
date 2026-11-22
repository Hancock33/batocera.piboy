################################################################################
#
# uboot-ps5000
#
################################################################################
# Version: Commits on Sept 13, 2021
UBOOT_PS5000_VERSION = e2c76fb6b0f89c5385273b3a83fbd2ce16903396
#634b85f106c0eb3d5167c989729b564253d60816
UBOOT_PS5000_SITE = $(call github,rk3128-cfw,caesar-u-boot,$(UBOOT_PS5000_VERSION))
UBOOT_PS5000_LICENSE = GPL-2.0
UBOOT_PS5000_BOOT_SRC = idbloader.img uboot.img:uboot-ps5000.img trust.img
UBOOT_PS5000_BINARIES_SUBDIR =

UBOOT_PS5000_DEPENDENCIES = host-batocera-rkbin

define UBOOT_PS5000_BUILD_CMDS
	# FIXME: there should be a better way to build
	cd $(@D) && ARCH=arm CHIP=rk3128 \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		$(MAKE) ps5000-rk3128_defconfig
	cd $(@D) && ARCH=arm CHIP=rk3128 \
		CROSS_COMPILE="$(TARGET_CROSS)" $(MAKE)

	# Generate idbloader.img
	$(@D)/tools/mkimage -n rk3128 -T rksd -d \
		$(BATOCERA_RKBIN_DIR)/bin/rk31/rk3128_ddr_300MHz_v2.12.bin \
		$(@D)/idbloader.img
	cat $(BATOCERA_RKBIN_DIR)/bin/rk31/rk3128x_miniloader_v2.57.bin >> \
		$(@D)/idbloader.img

	# Generate uboot.img
	$(@D)/tools/loaderimage --pack --uboot \
		$(@D)/u-boot-dtb.bin $(@D)/uboot.img --size 1024 4

	# Generate trust.img
	$(@D)/tools/loaderimage --pack --trustos \
		$(BATOCERA_RKBIN_DIR)/bin/rk31/rk3126_tee_ta_v2.01.bin \
		$(@D)/trust.img --size 1024 4
endef

$(eval $(boot-package))
