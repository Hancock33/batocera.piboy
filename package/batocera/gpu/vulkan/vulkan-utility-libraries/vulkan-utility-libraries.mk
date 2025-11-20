################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Nov 20, 2025
VULKAN_UTILITY_LIBRARIES_VERSION = 6fb6e7101d7b4484cd19604c2e304e2038ca1dc5
VULKAN_UTILITY_LIBRARIES_BRANCH = vulkan-tmp-1.4.333
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
