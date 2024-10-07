################################################################################
#
# vulkan-volk
#
################################################################################
# Version: Commits on Oct 07, 2024
VULKAN_VOLK_VERSION = e816744c664fe7e914fd08dfbef99fac669157ad
VULKAN_VOLK_SITE = $(call github,zeux,volk,$(VULKAN_VOLK_VERSION))
VULKAN_VOLK_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_VOLK_INSTALL_STAGING = YES
VULKAN_VOLK_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_VOLK_CONF_OPTS += -DVOLK_INSTALL=on

$(eval $(cmake-package))
