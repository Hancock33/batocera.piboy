################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Dec 20, 2024
VULKAN_VOLK_VERSION = 0b17a763ba5643e32da1b2152f8140461b3b7345
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
