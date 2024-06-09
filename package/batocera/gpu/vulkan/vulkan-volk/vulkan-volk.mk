################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Jun 07, 2024
VULKAN_VOLK_VERSION = 955e5e47f41feb28e1f67aab1b293613bafc9af3
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
