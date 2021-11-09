################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Nov 09, 2021
VULKAN_HEADERS_VERSION = 8c1c27d5a9b9de8a17f500053bd08c7ca6bba19c

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
