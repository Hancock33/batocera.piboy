################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Jun 21, 2021
VULKAN_HEADERS_VERSION = 37164a5726f7e6113810f9557903a117498421cf

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES = 
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
