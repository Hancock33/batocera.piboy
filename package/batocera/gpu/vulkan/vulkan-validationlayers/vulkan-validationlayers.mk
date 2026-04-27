################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Apr 27, 2026
VULKAN_VALIDATIONLAYERS_VERSION = c0bc7cd716ef477d20c29f8877205a8f3befdfad
VULKAN_VALIDATIONLAYERS_BRANCH = vulkan-tmp-1.4.349
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
