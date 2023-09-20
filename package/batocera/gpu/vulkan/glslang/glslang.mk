################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Sept 18, 2023
GLSLANG_VERSION = 4c57db1595462c51d5080893f65c42fc1f318146
GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(GLSLANG_VERSION))
GLSLANG_DEPENDENCIES = vulkan-headers vulkan-loader spirv-tools
GLSLANG_INSTALL_STAGING = YES
GLSLANG_SUPPORTS_IN_SOURCE_BUILD = NO

HOST_GLSLANG_CONF_OPTS += -DENABLE_OPT=0
GLSLANG_CONF_OPTS += -DENABLE_HLSL=ON -DENABLE_OPT=0
GLSLANG_CONF_ENV += LDFLAGS="--lpthread -ldl"

ifeq ($(BR2_PACKAGE_MESA3D),y)
GLSLANG_DEPENDENCIES += mesa3d
endif

define GLSLANG_INSTALL_OSDEPENENT
	cp -av $(GLSLANG_BUILDDIR)/glslang/OSDependent/Unix/libOSDependent.a $(STAGING_DIR)/usr/lib
	cp -av $(GLSLANG_BUILDDIR)/OGLCompilersDLL/libOGLCompiler.a		  $(STAGING_DIR)/usr/lib
endef

GLSLANG_POST_INSTALL_TARGET_HOOKS = GLSLANG_INSTALL_OSDEPENENT

$(eval $(cmake-package))
$(eval $(host-cmake-package))
