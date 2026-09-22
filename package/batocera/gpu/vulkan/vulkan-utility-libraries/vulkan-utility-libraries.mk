################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Sept 18, 2026
VULKAN_UTILITY_LIBRARIES_VERSION = 57f01541b3959f2528f769043396e882851a7e75
VULKAN_UTILITY_LIBRARIES_BRANCH = vulkan-sdk-1.4.363
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
