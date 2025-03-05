################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Feb 21, 2025
VULKAN_VALIDATIONLAYERS_VERSION = $(VULKAN_HEADERS_VERSION)
VULKAN_VALIDATIONLAYERS_SITE = https://github.com/KhronosGroup/Vulkan-ValidationLayers.git
VULKAN_VALIDATIONLAYERS_SITE_METHOD = git
VULKAN_VALIDATIONLAYERS_DEPENDENCIES = vulkan-headers vulkan-utility-libraries
VULKAN_VALIDATIONLAYERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
