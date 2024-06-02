################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on May 31, 2024
VULKAN_VOLK_VERSION = 16c2936b6dfa6d4523540e3511df4b9a2895c24d
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
