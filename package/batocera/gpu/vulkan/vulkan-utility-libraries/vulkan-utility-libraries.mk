################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Nov 06, 2026
VULKAN_UTILITY_LIBRARIES_VERSION = 5a873d3b75d38ef6a0833589ce3603d63f3f6a9c
VULKAN_UTILITY_LIBRARIES_BRANCH = vulkan-tmp-1.4.368
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_LICENSE = Apache-2.0
VULKAN_UTILITY_LIBRARIES_LICENSE_FILES = LICENSE.md
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
