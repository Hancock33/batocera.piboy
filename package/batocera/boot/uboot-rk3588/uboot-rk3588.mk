################################################################################
#
# uboot-rk3588
#
################################################################################
# Version: Commits on Mar 21, 2023
UBOOT_RK3588_VERSION = 2f6e967dc901ae570f522d1b47309e7c34acf542
UBOOT_RK3588_SITE = $(call github,stvhay,u-boot,$(UBOOT_RK3588_VERSION))
UBOOT_RK3588_LICENSE = GPL + Rockchip Proprietary (Extra Downloads)

define UBOOT_RK3588_BUILD_CMDS
	@echo "---- See github repository build.sh for build instructions. -----"
endef

define UBOOT_RK3588_INSTALL_TARGET_CMDS
	cp -rv $(@D)/staging/* $(BINARIES_DIR)
endef

$(eval $(generic-package))
