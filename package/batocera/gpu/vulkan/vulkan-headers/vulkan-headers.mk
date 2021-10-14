################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Oct 14, 2021
VULKAN_HEADERS_VERSION = dd99e0f51fa86210da384d0f17c036fa45475e12

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
