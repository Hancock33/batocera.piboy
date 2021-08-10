################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Aug 10, 2021
VULKAN_HEADERS_VERSION = 521f91d793e1799f0af57e013fa7e799afa1824c

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
