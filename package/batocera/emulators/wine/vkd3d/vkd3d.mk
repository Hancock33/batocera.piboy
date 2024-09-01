################################################################################
#
# vkd3d
#
################################################################################
# Version: Commits on Aug 29, 2024
VKD3D_VERSION = vkd3d-1.13
VKD3D_SITE = https://source.winehq.org/git/vkd3d.git
VKD3D_LICENSE = LGPL-2.1+
VKD3D_LICENSE_FILES = COPYING.LIB LICENSE
VKD3D_DEPENDENCIES = host-bison host-flex host-wine-custom spirv-headers host-libtool vulkan-headers vulkan-loader spirv-tools
VKD3D_CONF_ENV += WIDL="$(BUILD_DIR)/host-wine-custom-$(WINE_CUSTOM_VERSION)/tools/widl/widl"

VKD3D_CONF_OPTS = --disable-tests --with-sysroot=$(STAGING_DIR)

VKD3D_AUTORECONF = YES
VKD3D_INSTALL_STAGING = YES

$(eval $(autotools-package))
