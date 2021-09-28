################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Sept 28, 2021
VULKAN_HEADERS_VERSION = e500c7c809f9a2acfa556bf0974456353759f0a5

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
