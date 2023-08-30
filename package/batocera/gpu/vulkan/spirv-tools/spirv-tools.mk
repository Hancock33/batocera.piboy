################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Aug 30, 2023
SPIRV_TOOLS_VERSION = 51367c40fd10aa39016a3121a7f6b70ef6cbf836
SPIRV_TOOLS_SITE = https://github.com/KhronosGroup/SPIRV-Tools.git
SPIRV_TOOLS_SITE_METHOD = git
SPIRV_TOOLS_GIT_SUBMODULES = YES

SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"
SPIRV_TOOLS_CONF_OPTS += -DSPIRV_SKIP_TESTS=ON

$(eval $(cmake-package))
