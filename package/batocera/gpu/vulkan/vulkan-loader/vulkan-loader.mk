################################################################################
#
# vulkan-loader
#
################################################################################
# Version: Commits on Apr 05, 2022
VULKAN_LOADER_VERSION = ae24c6e79107e11df218cff8107f35a248d6e264
VULKAN_LOADER_SITE =  $(call github,KhronosGroup,Vulkan-Loader,$(VULKAN_LOADER_VERSION))
VULKAN_LOADER_DEPENDENCIES = vulkan-headers
VULKAN_LOADER_INSTALL_STAGING = YES
VULKAN_LOADER_CONF_OPTS += -DVULKAN_HEADERS_INSTALL_DIR=$(TARGET_DIR)/usr

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DUSE_GAS=OFF -DENABLE_WERROR=OFF
else
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF -DBUILD_WSI_XLIB_SUPPORT=OFF -DUSE_GAS=OFF -DENABLE_WERROR=OFF
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_LOADER_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
