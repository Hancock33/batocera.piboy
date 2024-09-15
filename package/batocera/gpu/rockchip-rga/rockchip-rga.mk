################################################################################
#
# rockchip-rga
#
################################################################################
# Version: Commits on Aug 29, 2024
ROCKCHIP_RGA_VERSION = 8e2a51b1c3e5b569aabc0b476f36550c1f332c41
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
