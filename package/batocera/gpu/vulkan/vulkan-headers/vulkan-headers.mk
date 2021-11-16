################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Nov 16, 2021
VULKAN_HEADERS_VERSION = 83e1a9ed8ce289cebb1c02c8167d663dc1befb24

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
