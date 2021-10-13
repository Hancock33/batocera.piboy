################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Oct 13, 2021
VULKAN_HEADERS_VERSION = bdd11ea20c4cfa642d59c6a24ba9495b4475654e

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
