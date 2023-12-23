################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Dec 22, 2023
GLSLANG_VERSION = 14.0.0
GLSLANG_SITE = $(call github,KhronosGroup,glslang,vulkan-sdk-$(GLSLANG_VERSION))
GLSLANG_DEPENDENCIES = vulkan-headers vulkan-loader spirv-tools
GLSLANG_INSTALL_STAGING = YES
GLSLANG_SUPPORTS_IN_SOURCE_BUILD = NO

HOST_GLSLANG_CONF_OPTS += -DENABLE_OPT=0
GLSLANG_CONF_OPTS += -DENABLE_HLSL=ON -DENABLE_OPT=0
GLSLANG_CONF_ENV += LDFLAGS="--lpthread -ldl"

ifeq ($(BR2_PACKAGE_MESA3D),y)
GLSLANG_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
