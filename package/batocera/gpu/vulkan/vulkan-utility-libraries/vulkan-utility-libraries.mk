################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Dec 09, 2024
VULKAN_UTILITY_LIBRARIES_VERSION = 160e946f5d4b3a657f47b7fc4b0bd3cc8d0d6afd
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
