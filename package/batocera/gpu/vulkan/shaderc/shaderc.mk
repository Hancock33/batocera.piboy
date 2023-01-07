################################################################################
#
# shaderc
#
################################################################################
# Version: Commits on Jan 04, 2023
SHADERC_VERSION = b810acf2c3d989e3fb27521f4f8cf13940160e23
SHADERC_SITE = $(call github,google,shaderc,$(SHADERC_VERSION))
SHADERC_DEPENDENCIES = spirv-tools
SHADERC_INSTALL_STAGING = YES

SHADERC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DSHADERC_SKIP_TESTS=ON -DSHADERC_SKIP_EXAMPLES=ON
SHADERC_CONF_OPTS += -Dglslang_SOURCE_DIR="$(BUILD_DIR)/glslang-$(GLSLANG_VERSION)"
SHADERC_CONF_OPTS += -Dspirv-tools_SOURCE_DIR="$(BUILD_DIR)/spirv-tools-$(SPIRV_TOOLS_VERSION)"

define SHADERC_DISABLE_3RD
	sed '/examples/d;/third_party/d' -i $(@D)/CMakeLists.txt
	sed '/add_subdirectory(glslc)/d'  -i $(@D)/CMakeLists.txt
endef
SHADERC_PRE_CONFIGURE_HOOKS += SHADERC_DISABLE_3RD

$(eval $(cmake-package))
