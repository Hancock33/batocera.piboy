################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Apr 18, 2025
VULKAN_VOLK_VERSION = vulkan-sdk-1.4.313.0
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
