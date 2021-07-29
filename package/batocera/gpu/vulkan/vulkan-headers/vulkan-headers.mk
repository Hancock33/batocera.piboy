################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Jul 27, 2021
VULKAN_HEADERS_VERSION = b8c57b0a09f7324fec5a7c363f5e26ff4d5a3222

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
