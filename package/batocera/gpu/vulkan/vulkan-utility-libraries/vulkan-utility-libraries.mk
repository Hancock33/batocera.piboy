################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Sept 26, 2025
VULKAN_UTILITY_LIBRARIES_VERSION = 4322db5906e67b57ec9c327e6afe3d98ed893df7
VULKAN_UTILITY_LIBRARIES_BRANCH = vulkan-sdk-1.4.328
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
