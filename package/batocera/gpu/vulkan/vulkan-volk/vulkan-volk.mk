################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Apr 14, 2024
VULKAN_VOLK_VERSION = a0d5468d1ad0471fee6eee6ba3bde0b3685f5853
VULKAN_VOLK_SITE =  https://github.com/zeux/volk
VULKAN_VOLK_GIT_SUBMODULES=YES
VULKAN_VOLK_SITE_METHOD=git
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
