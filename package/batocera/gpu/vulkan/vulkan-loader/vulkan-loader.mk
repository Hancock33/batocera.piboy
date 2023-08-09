################################################################################
#
# vulkan-loader
#
################################################################################
# Version: Commits on Aug 04, 2023
VULKAN_LOADER_VERSION = afdd025ead2b63b2c73d900ab128a2d3b512cdf0
VULKAN_LOADER_SITE =  $(call github,KhronosGroup,Vulkan-Loader,$(VULKAN_LOADER_VERSION))
VULKAN_LOADER_DEPENDENCIES = vulkan-headers
VULKAN_LOADER_INSTALL_STAGING = YES
VULKAN_LOADER_CMAKE_BACKEND = ninja

VULKAN_LOADER_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
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
