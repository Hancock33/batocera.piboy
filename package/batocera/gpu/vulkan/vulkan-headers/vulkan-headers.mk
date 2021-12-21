################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Dec 20, 2021
VULKAN_HEADERS_VERSION = 52a76fd0a693708eb8c25bd0ab7a1008091f64d4

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
