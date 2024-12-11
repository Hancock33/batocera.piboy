################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Dec 02, 2024
VULKAN_VOLK_VERSION = e767d0ee782709f2bd2df148927ddab02f2dbfe4
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
