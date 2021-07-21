################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Jul 20, 2021
VULKAN_HEADERS_VERSION = 872fa25bb6df67e1b338c1533ad55244b6ff8994

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
