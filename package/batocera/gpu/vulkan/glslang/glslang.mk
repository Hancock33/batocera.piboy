################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Aug 07, 2023
GLSLANG_VERSION = 34d4f78f03b32960a4e94419ea1c58613726d159
GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(GLSLANG_VERSION))
GLSLANG_DEPENDENCIES = vulkan-headers vulkan-loader
GLSLANG_INSTALL_STAGING = YES
GLSLANG_SUPPORTS_IN_SOURCE_BUILD = NO
GLSLANG_CMAKE_BACKEND = ninja

GLSLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
GLSLANG_CONF_OPTS += -DENABLE_HLSL=ON
GLSLANG_CONF_ENV += LDFLAGS="--lpthread -ldl"

HOST_GLSLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

ifeq ($(BR2_PACKAGE_MESA3D),y)
GLSLANG_DEPENDENCIES += mesa3d
endif

define GLSLANG_INSTALL_OSDEPENENT
	cp -av $(GLSLANG_BUILDDIR)/glslang/OSDependent/Unix/libOSDependent.a $(STAGING_DIR)/usr/lib
	cp -av $(GLSLANG_BUILDDIR)/OGLCompilersDLL/libOGLCompiler.a          $(STAGING_DIR)/usr/lib
endef

GLSLANG_POST_INSTALL_TARGET_HOOKS = GLSLANG_INSTALL_OSDEPENENT

$(eval $(cmake-package))
$(eval $(host-cmake-package))
