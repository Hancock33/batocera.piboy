################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Jan 29, 2026
VULKAN_VALIDATIONLAYERS_VERSION = 971893efdc1b33aebc1e59e8b606c2ef048a0d3b
VULKAN_VALIDATIONLAYERS_BRANCH = vulkan-sdk-1.4.341
VULKAN_VALIDATIONLAYERS_SITE = https://github.com/KhronosGroup/Vulkan-ValidationLayers.git
VULKAN_VALIDATIONLAYERS_SITE_METHOD = git
VULKAN_VALIDATIONLAYERS_DEPENDENCIES = vulkan-headers vulkan-utility-libraries
VULKAN_VALIDATIONLAYERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_WAYLAND),y)
VULKAN_VALIDATIONLAYERS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=ON
else
VULKAN_VALIDATIONLAYERS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=OFF
endif

$(eval $(cmake-package))
