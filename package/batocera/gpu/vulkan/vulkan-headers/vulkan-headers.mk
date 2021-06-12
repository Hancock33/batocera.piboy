################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Jun 07, 2021
VULKAN_HEADERS_VERSION = 07c4a37bcf41ea50aef6e98236abdfe8089fb4c6

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES = 
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
