################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Jan 12, 2026
VULKAN_UTILITY_LIBRARIES_VERSION = b4e9ebbfc779cba85f1efbe2f69fdfc5744ed5e5
VULKAN_UTILITY_LIBRARIES_BRANCH = vulkan-tmp-1.4.338
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
