################################################################################
#
# rockchip-rga
#
################################################################################
# Version: Commits on Apr 30, 2025
ROCKCHIP_RGA_VERSION = f3be6d8132b09a3b5569d1981a37fe627a27e370
ROCKCHIP_RGA_SITE = $(call github,JeffyCN,mirrors,linux-rga,$(ROCKCHIP_RGA_VERSION))
ROCKCHIP_RGA_BRANCH = linux-rga-multi

# RK3326 needs the older rockchip-rga for it's 4.4 kernel
ifeq ($(BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4),y)
# Version.: Commits on Aug 5, 2021
ROCKCHIP_RGA_VERSION = df26244eb0c3991df319d4276ab80e8c0bf91f64
ROCKCHIP_RGA_SITE = https://github.com/batocera-linux/rockchip-packages/releases/download/20220303
endif

ROCKCHIP_RGA_LICENSE = Apache License 2.0
ROCKCHIP_RGA_DEPENDENCIES = libdrm

ROCKCHIP_RGA_INSTALL_STAGING = YES

$(eval $(meson-package))
