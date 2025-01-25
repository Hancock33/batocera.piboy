################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Jan 10, 2025
VULKAN_VALIDATIONLAYERS_VERSION = vulkan-sdk-1.4.304.0
VULKAN_VALIDATIONLAYERS_SITE = https://github.com/KhronosGroup/Vulkan-ValidationLayers.git
VULKAN_VALIDATIONLAYERS_SITE_METHOD = git
VULKAN_VALIDATIONLAYERS_DEPENDENCIES = vulkan-headers vulkan-utility-libraries
VULKAN_VALIDATIONLAYERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
