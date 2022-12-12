################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Dec 12, 2022
GLSLANG_VERSION = c6b3f279a7aa5b37efa8b468332589c07c753805
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
