################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Oct 05, 2021
VULKAN_HEADERS_VERSION = fa27a13cf74080df2ad421a788299db1276f17a7

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
