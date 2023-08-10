################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Aug 10, 2023
SPIRV_TOOLS_VERSION = 8e3da01b45806fbacbb9e6fce9c5f9ae49f60e42
SPIRV_TOOLS_SITE = https://github.com/KhronosGroup/SPIRV-Tools.git
SPIRV_TOOLS_SITE_METHOD = git
SPIRV_TOOLS_GIT_SUBMODULES = YES
SPIRV_TOOLS_CMAKE_BACKEND = ninja

SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"
SPIRV_TOOLS_CONF_OPTS += -DSPIRV_SKIP_TESTS=ON

$(eval $(cmake-package))
