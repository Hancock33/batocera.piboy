################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on May 10, 2024
VULKAN_VOLK_VERSION = 749f0ab4e9e69394f4d1d39cbb11b5fb6c9e31b1
VULKAN_VOLK_SITE =  https://github.com/zeux/volk
VULKAN_VOLK_GIT_SUBMODULES=YES
VULKAN_VOLK_SITE_METHOD=git
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
