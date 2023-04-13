################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Apr 12, 2023
SPIRV_TOOLS_VERSION = 9a4e7a1eb5dd5b2faa8489c74970e93cd8e8418b
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
