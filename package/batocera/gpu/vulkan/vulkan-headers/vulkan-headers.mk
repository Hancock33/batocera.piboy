################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Aug 29, 2021
VULKAN_HEADERS_VERSION = 9e62d027636cd7210f60d934f56107ed6e1579b8

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
