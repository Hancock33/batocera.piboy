################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Feb 23, 2023
GLSLANG_VERSION = c43008e82993b460944533656a1d4a4467aa17af
GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(GLSLANG_VERSION))
GLSLANG_DEPENDENCIES = vulkan-headers vulkan-loader
GLSLANG_INSTALL_STAGING = YES
GLSLANG_SUPPORTS_IN_SOURCE_BUILD = NO

GLSLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
GLSLANG_CONF_ENV += LDFLAGS="--lpthread -ldl"

HOST_GLSLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

ifeq ($(BR2_PACKAGE_MESA3D),y)
GLSLANG_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
