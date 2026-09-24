################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Sept 24, 2026
VULKAN_VALIDATIONLAYERS_VERSION = e0364526e0333580fec0b7372ca61311245fe835
VULKAN_VALIDATIONLAYERS_BRANCH = vulkan-sdk-1.4.363
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
