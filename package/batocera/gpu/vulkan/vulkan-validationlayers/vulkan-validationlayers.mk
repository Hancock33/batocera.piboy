################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Dec 04, 2025
VULKAN_VALIDATIONLAYERS_VERSION = 5e6c6bd96224c1c0bb73414a9227d93f7cc236b0
VULKAN_VALIDATIONLAYERS_BRANCH = vulkan-sdk-1.4.335
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
