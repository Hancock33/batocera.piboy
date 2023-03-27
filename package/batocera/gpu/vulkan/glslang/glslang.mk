################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Mar 25, 2023
GLSLANG_VERSION = 45405e1d942e7af1a1f2fad94a8b9ddf2600af0d
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
