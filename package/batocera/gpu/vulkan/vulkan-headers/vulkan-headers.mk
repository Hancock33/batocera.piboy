################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Jun 14, 2021
VULKAN_HEADERS_VERSION = 9d10a96f2d57c3c37e167f2e73c9a31ac2e51fa5

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES = 
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
