################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Mar 13, 2023
SPIRV_TOOLS_VERSION = 25f6c0cea5a573a1c9ebe334a44b096a30708fba
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
