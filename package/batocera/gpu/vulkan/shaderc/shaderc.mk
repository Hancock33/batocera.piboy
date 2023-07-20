################################################################################
#
# shaderc
#
################################################################################
# Version: Commits on Jul 19, 2023
SHADERC_VERSION = 7754fcd8ba5c0d0f5ecccab8429493ccdc8b8d95
SHADERC_SITE =  $(call github,google,shaderc,$(SHADERC_VERSION))
SHADERC_DEPENDENCIES = vulkan-headers vulkan-loader glslang spirv-tools host-ninja
SHADERC_INSTALL_STAGING = YES
SHADERC_SUPPORTS_IN_SOURCE_BUILD = NO

SHADERC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS=""
SHADERC_CONF_OPTS += -GNinja
SHADERC_CONF_OPTS += -DSHADERC_SKIP_TESTS=ON
SHADERC_CONF_OPTS += -Dglslang_SOURCE_DIR=$(STAGING_DIR)/usr/include/glslang

define SHADERC_THIRDPARTY
	$(SED) '/examples/d;/third_party/d' -i $(@D)/CMakeLists.txt
	$(SED) '/build-version/d' -i $(@D)/glslc/CMakeLists.txt
	$(@D)/utils/update_build_version.py $(@D) $(SPIRV_TOOLS_BUILDDIR) $(GLSLANG_BUILDDIR) $(@D)/glslc/src/build-version.inc
endef

SHADERC_POST_PATCH_HOOKS += SHADERC_THIRDPARTY

define SHADERC_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(SHADERC_BUILDDIR)
endef

define SHADERC_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(SHADERC_BUILDDIR)
endef

define SHADERC_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(SHADERC_BUILDDIR)
endef

$(eval $(cmake-package))
