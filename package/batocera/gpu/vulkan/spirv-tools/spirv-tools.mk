################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Aug 14, 2023
SPIRV_TOOLS_VERSION = fddcc8cedca662b0e90690f2556d46f359e5a9a8
SPIRV_TOOLS_SITE = https://github.com/KhronosGroup/SPIRV-Tools.git
SPIRV_TOOLS_SITE_METHOD = git
SPIRV_TOOLS_GIT_SUBMODULES = YES

SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"
SPIRV_TOOLS_CONF_OPTS += -DSPIRV_SKIP_TESTS=ON

$(eval $(cmake-package))
