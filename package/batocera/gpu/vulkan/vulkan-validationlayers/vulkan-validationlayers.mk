################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Nov 16, 2026
VULKAN_VALIDATIONLAYERS_VERSION = 4e3836dc0d2619cf8aec16e2d7ef26e9364cb995
VULKAN_VALIDATIONLAYERS_BRANCH = vulkan-tmp-1.4.368
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
