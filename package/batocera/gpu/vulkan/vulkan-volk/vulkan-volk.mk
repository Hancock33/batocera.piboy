################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Feb 03, 2024
VULKAN_VOLK_VERSION = 07dde6534504812b892f940eaa71cc0255f6a8b3
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
