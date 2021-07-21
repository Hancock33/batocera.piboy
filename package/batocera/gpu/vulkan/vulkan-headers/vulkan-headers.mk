################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Jul 05, 2021
VULKAN_HEADERS_VERSION = 0193e158bc9f4d17e3c3a61c9311a0439ed5572d

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
