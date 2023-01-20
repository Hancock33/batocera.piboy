################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Jan 20, 2023
SPIRV_TOOLS_VERSION = cdc4e528f3dbe7e38fa3438544918757b098235c
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
