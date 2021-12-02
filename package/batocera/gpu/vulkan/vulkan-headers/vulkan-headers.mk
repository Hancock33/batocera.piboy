################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Dec 01, 2021
VULKAN_HEADERS_VERSION = ea61f32f24d2ce28b358e154910fb4eb410ffd79

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
