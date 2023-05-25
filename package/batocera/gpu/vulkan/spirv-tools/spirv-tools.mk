################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on May 25, 2023
SPIRV_TOOLS_VERSION = e0936b646cdd2c7bb930501a26f2b95b2f684455
SPIRV_TOOLS_SITE = https://github.com/KhronosGroup/SPIRV-Tools.git
SPIRV_TOOLS_SITE_METHOD = git
SPIRV_TOOLS_GIT_SUBMODULES = YES

SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)" -DSPIRV_SKIP_TESTS=ON

$(eval $(cmake-package))
