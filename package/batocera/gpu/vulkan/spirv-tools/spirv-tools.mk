################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Sept 06, 2023
SPIRV_TOOLS_VERSION = d660bb55be0c5591cb733c9c2ebf5a9d97129d3a
SPIRV_TOOLS_SITE = https://github.com/KhronosGroup/SPIRV-Tools.git
SPIRV_TOOLS_SITE_METHOD = git
SPIRV_TOOLS_GIT_SUBMODULES = YES

SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"
SPIRV_TOOLS_CONF_OPTS += -DSPIRV_SKIP_TESTS=ON

$(eval $(cmake-package))
