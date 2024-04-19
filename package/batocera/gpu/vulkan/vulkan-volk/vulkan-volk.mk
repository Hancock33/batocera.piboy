################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Apr 19, 2024
VULKAN_VOLK_VERSION = 3a8068a57417940cf2bf9d837a7bb60d015ca2f1
VULKAN_VOLK_SITE =  https://github.com/zeux/volk
VULKAN_VOLK_GIT_SUBMODULES=YES
VULKAN_VOLK_SITE_METHOD=git
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
