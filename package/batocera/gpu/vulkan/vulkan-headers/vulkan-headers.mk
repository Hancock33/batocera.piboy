################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Nov 02, 2021
VULKAN_HEADERS_VERSION = 51a326d756d279652187d0e66433a7b10660f311

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
