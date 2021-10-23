################################################################################
#
# VULKAN_LOADER
#
################################################################################
# Version.: Commits on Oct 22, 2021
VULKAN_LOADER_VERSION = 5a4c691700bcf46f1b6a2f36046c3dea771f79f3

VULKAN_LOADER_SITE =  $(call github,KhronosGroup,Vulkan-Loader,$(VULKAN_LOADER_VERSION))
VULKAN_LOADER_DEPENDENCIES = vulkan-headers
VULKAN_LOADER_INSTALL_STAGING = YES
VULKAN_LOADER_CONF_OPTS += -DVULKAN_HEADERS_INSTALL_DIR=$(TARGET_DIR)/usr

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF -DBUILD_WSI_XLIB_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_LOADER_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
