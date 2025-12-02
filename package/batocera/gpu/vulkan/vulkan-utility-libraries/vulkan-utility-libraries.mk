################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Nov 28, 2025
VULKAN_UTILITY_LIBRARIES_VERSION = c010c19e796035e92fb3b0462cb887518a41a7c1
VULKAN_UTILITY_LIBRARIES_BRANCH = vulkan-sdk-1.4.335
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
