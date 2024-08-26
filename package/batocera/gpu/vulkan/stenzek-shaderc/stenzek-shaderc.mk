################################################################################
#
# stenzek-shaderc
#
################################################################################
# Version: Commits on Aug 24, 2024
STENZEK_SHADERC_VERSION = f60bb80e255144e71776e2ad570d89b78ea2ab4f
STENZEK_SHADERC_SITE =  $(call github,stenzek,shaderc,$(STENZEK_SHADERC_VERSION))
STENZEK_SHADERC_DEPENDENCIES = vulkan-headers vulkan-loader glslang spirv-tools
STENZEK_SHADERC_INSTALL_STAGING = YES
STENZEK_SHADERC_SUPPORTS_IN_SOURCE_BUILD = NO

STENZEK_SHADERC_CONF_OPTS += -DSHADERC_ENABLE_TESTS=OFF
STENZEK_SHADERC_CONF_OPTS += -DSTENZEK_SHADERC_SKIP_TESTS=ON
STENZEK_SHADERC_CONF_OPTS += -DSTENZEK_SHADERC_SKIP_EXAMPLES=ON
STENZEK_SHADERC_CONF_OPTS += -Dglslang_SOURCE_DIR=$(STAGING_DIR)/usr/include/glslang

define STENZEK_SHADERC_THIRDPARTY
	$(SED) '/third_party/d' -i $(@D)/CMakeLists.txt
	$(SED) '/build-version/d' -i $(@D)/glslc/CMakeLists.txt
	$(@D)/utils/update_build_version.py $(@D) $(SPIRV_TOOLS_BUILDDIR) $(GLSLANG_BUILDDIR) $(@D)/glslc/src/build-version.inc
endef

STENZEK_SHADERC_INSTALL_STAGING_OPTS = --prefix /stenzek-shaderc

STENZEK_SHADERC_POST_PATCH_HOOKS += STENZEK_SHADERC_THIRDPARTY

define STENZEK_SHADERC_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib
	$(INSTALL) -D $(@D)/buildroot-build/libshaderc/libshaderc_stenzek.so $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))
