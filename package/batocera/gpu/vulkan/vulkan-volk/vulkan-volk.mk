################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Oct 18, 2024
VULKAN_VOLK_VERSION = 086957f3b39ac0a37fb7f344a523bef9b194ba8f
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
