################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Sep 07, 2021
VULKAN_HEADERS_VERSION = 4fee3efc189c83ccd26a9cd8265185c98458c94d

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
