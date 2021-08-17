################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Aug 17, 2021
VULKAN_HEADERS_VERSION = c5b7a2fa18750e435e91e06a50cdc5451c5b9abd

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
