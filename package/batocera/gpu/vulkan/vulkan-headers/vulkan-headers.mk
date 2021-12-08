################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Dec 07, 2021
VULKAN_HEADERS_VERSION = e005e1f8175d006adc3676b40ac3dd2212961a68

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
