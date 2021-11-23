################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Nov 23, 2021
VULKAN_HEADERS_VERSION = a15237165443ba1ef430ed332745f9a99ec509ad

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
