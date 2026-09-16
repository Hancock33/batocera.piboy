################################################################################
#
# shaderc
#
################################################################################
# Version: Commits on Sept 11, 2026
SHADERC_VERSION = v2026.4
SHADERC_SITE =  $(call github,google,shaderc,$(SHADERC_VERSION))
SHADERC_DEPENDENCIES = vulkan-headers vulkan-loader glslang spirv-tools
SHADERC_INSTALL_STAGING = YES
SHADERC_SUPPORTS_IN_SOURCE_BUILD = NO

SHADERC_CONF_OPTS += -DSHADERC_SKIP_TESTS=ON
SHADERC_CONF_OPTS += -DSHADERC_SKIP_EXAMPLES=ON
SHADERC_CONF_OPTS += -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
SHADERC_CONF_OPTS += -Dglslang_SOURCE_DIR=$(STAGING_DIR)/usr/include/glslang

# Host variant: provides glslc on the build host, for packages that compile
# GLSL to SPIR-V at build time (e.g. sm2-emu).
HOST_SHADERC_DEPENDENCIES = host-glslang host-spirv-headers host-spirv-tools
HOST_SHADERC_CONF_OPTS += -DSHADERC_SKIP_TESTS=ON
HOST_SHADERC_CONF_OPTS += -DSHADERC_SKIP_EXAMPLES=ON
HOST_SHADERC_CONF_OPTS += -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
HOST_SHADERC_CONF_OPTS += -Dglslang_SOURCE_DIR=$(HOST_DIR)/usr/include/glslang

define SHADERC_THIRDPARTY
	$(SED) '/third_party/d' -i $(@D)/CMakeLists.txt
	$(SED) '/build-version/d' -i $(@D)/glslc/CMakeLists.txt
	$(@D)/utils/update_build_version.py $(@D) $(SPIRV_TOOLS_BUILDDIR) $(GLSLANG_BUILDDIR) $(@D)/glslc/src/build-version.inc
endef

SHADERC_POST_PATCH_HOOKS += SHADERC_THIRDPARTY
HOST_SHADERC_PRE_CONFIGURE_HOOKS += SHADERC_THIRDPARTY

$(eval $(cmake-package))
$(eval $(host-cmake-package))
