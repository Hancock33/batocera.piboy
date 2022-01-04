################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Jan 04, 2022
VULKAN_HEADERS_VERSION = d99496fcb1f4aecbeb25c1e70eda0cdee7e1eba5

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
