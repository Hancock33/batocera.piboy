################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Jan 23, 2026
VULKAN_UTILITY_LIBRARIES_VERSION = a663eca87ba71294dd4b74ba9d3e64a72d725453
VULKAN_UTILITY_LIBRARIES_BRANCH = vulkan-sdk-1.4.341
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
