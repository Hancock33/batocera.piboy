################################################################################
#
# VULKAN_HEADERS
#
################################################################################
# Version.: Commits on Aug 03, 2021
VULKAN_HEADERS_VERSION = 9fe958cdabcaf87650a4517b27df1ec2034d051f

VULKAN_HEADERS_SITE =  $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_DEPENDENCIES =
VULKAN_HEADERS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_HEADERS_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
