################################################################################
#
# vulkan-utility-libraries
#
################################################################################
# Version: Commits on Apr 14, 2026
VULKAN_UTILITY_LIBRARIES_VERSION = cd5e8020b5feea8f9364c87290cda4f9180be01a
VULKAN_UTILITY_LIBRARIES_BRANCH = vulkan-tmp-1.4.349
VULKAN_UTILITY_LIBRARIES_SITE = https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
VULKAN_UTILITY_LIBRARIES_SITE_METHOD = git
VULKAN_UTILITY_LIBRARIES_INSTALL_STAGING = YES
VULKAN_UTILITY_LIBRARIES_INSTALL_TARGET = NO
VULKAN_UTILITY_LIBRARIES_DEPENDENCIES = vulkan-headers spirv-headers

$(eval $(cmake-package))
