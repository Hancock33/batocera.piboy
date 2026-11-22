################################################################################
#
# vulkan-validationlayers
#
################################################################################
# Version: Commits on Nov 18, 2026
VULKAN_VALIDATIONLAYERS_VERSION = b909e01359469b1bf26ba8b538900dd420c57c93
VULKAN_VALIDATIONLAYERS_BRANCH = vulkan-tmp-1.4.368
VULKAN_VALIDATIONLAYERS_SITE = https://github.com/KhronosGroup/Vulkan-ValidationLayers.git
VULKAN_VALIDATIONLAYERS_SITE_METHOD = git
VULKAN_VALIDATIONLAYERS_LICENSE = Apache-2.0
VULKAN_VALIDATIONLAYERS_LICENSE_FILES = LICENSE.txt
VULKAN_VALIDATIONLAYERS_DEPENDENCIES = vulkan-headers vulkan-utility-libraries
VULKAN_VALIDATIONLAYERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_WAYLAND),y)
VULKAN_VALIDATIONLAYERS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=ON
else
VULKAN_VALIDATIONLAYERS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=OFF
endif

$(eval $(cmake-package))
