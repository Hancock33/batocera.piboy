################################################################################
#
# shaderc
#
################################################################################
# Version: Commits on Jul 19, 2023
SHADERC_VERSION = 4d98dac61ee4857ea0691a2b9a48aee44eb409db
SHADERC_SITE =  $(call github,google,shaderc,$(SHADERC_VERSION))
SHADERC_DEPENDENCIES = vulkan-headers vulkan-loader glslang spirv-tools
SHADERC_INSTALL_STAGING = YES
SHADERC_SUPPORTS_IN_SOURCE_BUILD = NO
SHADERC_CMAKE_BACKEND = ninja


SHADERC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS=""
SHADERC_CONF_OPTS += -DSHADERC_SKIP_TESTS=ON
SHADERC_CONF_OPTS += -Dglslang_SOURCE_DIR=$(STAGING_DIR)/usr/include/glslang

define SHADERC_THIRDPARTY
	$(SED) '/examples/d;/third_party/d' -i $(@D)/CMakeLists.txt
	$(SED) '/build-version/d' -i $(@D)/glslc/CMakeLists.txt
	$(@D)/utils/update_build_version.py $(@D) $(SPIRV_TOOLS_BUILDDIR) $(GLSLANG_BUILDDIR) $(@D)/glslc/src/build-version.inc
endef

SHADERC_POST_PATCH_HOOKS += SHADERC_THIRDPARTY

$(eval $(cmake-package))
