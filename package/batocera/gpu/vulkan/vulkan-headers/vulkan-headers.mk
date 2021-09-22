################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Sep 21, 2021
VULKAN_HEADERS_VERSION = 31dfaa4c632eec61f273f87d920237f0c7163dcf

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
