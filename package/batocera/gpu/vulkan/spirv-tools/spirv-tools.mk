################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Jun 09, 2023
SPIRV_TOOLS_VERSION = 9c66587d14e29e2863f1694d7abbd78e9a60e2eb
SPIRV_TOOLS_SITE = https://github.com/KhronosGroup/SPIRV-Tools.git
SPIRV_TOOLS_SITE_METHOD = git
SPIRV_TOOLS_GIT_SUBMODULES = YES

SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)" -DSPIRV_SKIP_TESTS=ON

$(eval $(cmake-package))
