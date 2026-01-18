################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Jan 14, 2026
VULKAN_VALIDATIONLAYERS_VERSION = a4de6d6fafe1a1f477ca300f05fa79d8921a4901
VULKAN_VALIDATIONLAYERS_BRANCH = vulkan-tmp-1.4.338
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
