################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Jan 06, 2025
VULKAN_VOLK_VERSION = 1.4.304
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
