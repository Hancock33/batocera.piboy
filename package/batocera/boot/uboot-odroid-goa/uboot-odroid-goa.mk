################################################################################
#
# uboot-odroid-goa
#
################################################################################
# Version: Commits on Apr 30, 2026
UBOOT_ODROID_GOA_VERSION = 7d5876d36f4120034f1902b12d6799b147bec884
UBOOT_ODROID_GOA_SITE = https://github.com/hardkernel/u-boot.git
UBOOT_ODROID_GOA_SITE_METHOD=git
UBOOT_ODROID_GOA_BOOT_SRC = idbloader.img uboot.img trust.img
UBOOT_ODROID_GOA_BOOT_SRC_DIR = $(UBOOT_ODROID_GOA_BUILDDIR)/sd_fuse
UBOOT_ODROID_GOA_BINARIES_SUBDIR =

UBOOT_ODROID_GOA_DEPENDENCIES = host-toolchain-optional-linaro-aarch64

define UBOOT_ODROID_GOA_BUILD_CMDS
		cd $(@D) && $(@D)/make.sh odroidgoa
endef

$(eval $(boot-package))
