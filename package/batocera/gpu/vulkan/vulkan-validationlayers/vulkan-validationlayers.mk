################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Dec 11, 2024
VULKAN_VALIDATIONLAYERS_VERSION = ca82303b6bad637c08d94baa80dea17b541649ed
VULKAN_VALIDATIONLAYERS_SITE = https://github.com/KhronosGroup/Vulkan-ValidationLayers.git
VULKAN_VALIDATIONLAYERS_SITE_METHOD = git
VULKAN_VALIDATIONLAYERS_DEPENDENCIES = vulkan-headers vulkan-utility-libraries
VULKAN_VALIDATIONLAYERS_INSTALL_STAGING = YES


$(eval $(cmake-package))
