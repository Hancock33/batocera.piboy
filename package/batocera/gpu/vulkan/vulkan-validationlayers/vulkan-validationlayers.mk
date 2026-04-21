################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Apr 20, 2026
VULKAN_VALIDATIONLAYERS_VERSION = ed378de2244282362bc4a895e3ef7186c5ed8d83
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
