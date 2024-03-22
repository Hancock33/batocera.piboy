################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Mar 22, 2024
VULKAN_VOLK_VERSION = c5dbc0a7b38786b4d81d4057088b29390dd320df
VULKAN_VOLK_SITE =  https://github.com/zeux/volk
VULKAN_VOLK_GIT_SUBMODULES=YES
VULKAN_VOLK_SITE_METHOD=git
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
