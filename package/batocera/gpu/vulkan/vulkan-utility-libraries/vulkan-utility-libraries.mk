################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Jul 04, 2025
VULKAN_UTILITY_LIBRARIES_VERSION = vulkan-sdk-1.4.321.0
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
