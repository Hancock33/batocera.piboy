################################################################################
#
# VULKAN_LOADER
#
################################################################################
# Version.: Commits on Jan 10, 2022
VULKAN_LOADER_VERSION = a72d5bc3eb413b53ff9d5165afc6ded9fcf8e115

VULKAN_LOADER_SITE =  $(call github,KhronosGroup,Vulkan-Loader,$(VULKAN_LOADER_VERSION))
VULKAN_LOADER_DEPENDENCIES = vulkan-headers
VULKAN_LOADER_INSTALL_STAGING = YES
VULKAN_LOADER_CONF_OPTS += -DVULKAN_HEADERS_INSTALL_DIR=$(TARGET_DIR)/usr

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON
else
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF -DBUILD_WSI_XLIB_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_LOADER_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
