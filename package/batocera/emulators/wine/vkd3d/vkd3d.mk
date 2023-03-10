################################################################################
#
# vkd3d
#
################################################################################
# Commits on 09 Mar, 2023
VKD3D_VERSION = da2435707b82ac4dc1f8f4784e89f1b1b7eaf0f1
VKD3D_SITE = git://source.winehq.org/git/vkd3d
VKD3D_LICENSE = LGPL-2.1+
VKD3D_LICENSE_FILES = COPYING.LIB LICENSE
VKD3D_DEPENDENCIES = host-bison host-flex host-wine-lutris spirv-headers host-libtool vulkan-headers vulkan-loader
VKD3D_CONF_ENV += WIDL="$(BUILD_DIR)/host-wine-lutris-$(WINE_VERSION)/tools/widl/widl"

VKD3D_CONF_OPTS = --disable-tests --with-sysroot=$(STAGING_DIR)

VKD3D_AUTORECONF = YES
VKD3D_INSTALL_STAGING = YES

$(eval $(autotools-package))
