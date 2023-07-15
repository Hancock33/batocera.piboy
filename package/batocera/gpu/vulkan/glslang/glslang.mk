################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Jul 13, 2023
GLSLANG_VERSION = f47028995cf397f3f3396b9356d5b82ee3794259
GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(GLSLANG_VERSION))
GLSLANG_DEPENDENCIES = vulkan-headers vulkan-loader host-ninja
GLSLANG_INSTALL_STAGING = YES
GLSLANG_SUPPORTS_IN_SOURCE_BUILD = NO

GLSLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
GLSLANG_CONF_OPTS += -DENABLE_HLSL=ON
GLSLANG_CONF_ENV += LDFLAGS="--lpthread -ldl"

HOST_GLSLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

ifeq ($(BR2_PACKAGE_MESA3D),y)
GLSLANG_DEPENDENCIES += mesa3d
endif

define HOST_GLSLANG_BUILD_CMDS
	$(HOST_MAKE_ENV) $(BR2_CMAKE) --build $(HOST_GLSLANG_BUILDDIR)
endef

define HOST_GLSLANG_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_GLSLANG_BUILDDIR)
endef

define GLSLANG_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(GLSLANG_BUILDDIR)
endef

define GLSLANG_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(GLSLANG_BUILDDIR)
endef

define GLSLANG_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(GLSLANG_BUILDDIR)
endef

define GLSLANG_INSTALL_OSDEPENENT
	cp -av $(GLSLANG_BUILDDIR)/glslang/OSDependent/Unix/libOSDependent.a $(STAGING_DIR)/usr/lib
	cp -av $(GLSLANG_BUILDDIR)/OGLCompilersDLL/libOGLCompiler.a          $(STAGING_DIR)/usr/lib
endef

GLSLANG_POST_INSTALL_TARGET_HOOKS = GLSLANG_INSTALL_OSDEPENENT

$(eval $(cmake-package))
$(eval $(host-cmake-package))
