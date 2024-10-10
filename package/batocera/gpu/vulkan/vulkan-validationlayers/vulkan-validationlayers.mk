################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Oct 04, 2024
VULKAN_VALIDATIONLAYERS_VERSION = vulkan-sdk-1.3.296.0
VULKAN_VALIDATIONLAYERS_SITE = https://github.com/KhronosGroup/Vulkan-ValidationLayers.git
VULKAN_VALIDATIONLAYERS_SITE_METHOD = git
VULKAN_VALIDATIONLAYERS_DEPENDENCIES = vulkan-headers vulkan-utility-libraries
VULKAN_VALIDATIONLAYERS_INSTALL_STAGING = YES

VULKAN_VALIDATIONLAYERS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
