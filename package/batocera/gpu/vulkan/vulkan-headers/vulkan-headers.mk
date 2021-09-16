################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Sep 14, 2021
VULKAN_HEADERS_VERSION = c519fd7a3f3b3baf0df16395356cecf4bfee2a8c

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
