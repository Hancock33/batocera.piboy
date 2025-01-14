################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Dec 20, 2024
VULKAN_VALIDATIONLAYERS_VERSION = v1.4.304
VULKAN_VALIDATIONLAYERS_SITE = https://github.com/KhronosGroup/Vulkan-ValidationLayers.git
VULKAN_VALIDATIONLAYERS_SITE_METHOD = git
VULKAN_VALIDATIONLAYERS_DEPENDENCIES = vulkan-headers vulkan-utility-libraries
VULKAN_VALIDATIONLAYERS_INSTALL_STAGING = YES


$(eval $(cmake-package))
