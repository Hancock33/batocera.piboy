################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Jul 01, 2023
SPIRV_TOOLS_VERSION = 58459c2b1adb43c9e8705823b78a12e95e8c430f
SPIRV_TOOLS_SITE = https://github.com/KhronosGroup/SPIRV-Tools.git
SPIRV_TOOLS_SITE_METHOD = git
SPIRV_TOOLS_GIT_SUBMODULES = YES

SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)" -DSPIRV_SKIP_TESTS=ON

$(eval $(cmake-package))
