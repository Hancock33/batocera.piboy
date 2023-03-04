################################################################################
#
# vulkan-loader
#
################################################################################
# Version: Commits on Feb 25, 2023
VULKAN_LOADER_VERSION = 3db19f3e3d8b0c96dc1ffcb5888c06e306df478c
VULKAN_LOADER_SITE =  $(call github,KhronosGroup,Vulkan-Loader,$(VULKAN_LOADER_VERSION))
VULKAN_LOADER_DEPENDENCIES = vulkan-headers
VULKAN_LOADER_INSTALL_STAGING = YES
VULKAN_LOADER_CONF_OPTS += -DVULKAN_HEADERS_INSTALL_DIR=$(STAGING_DIR)/usr

ifeq ($(BR2_PACKAGE_XORG7),y)
VULKAN_LOADER_DEPENDENCIES += xlib_libXrandr
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DUSE_GAS=OFF
else
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF -DBUILD_WSI_XLIB_SUPPORT=OFF -DUSE_GAS=OFF
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_LOADER_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
