################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Sept 26, 2024
VULKAN_VOLK_VERSION = 59d26900f53c7621a8ba8ab0e3f18d3bd883fa9a
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
