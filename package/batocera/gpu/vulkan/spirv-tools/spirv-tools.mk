################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Apr 13, 2022
SPIRV_TOOLS_VERSION = 898ba64d2463bb70a2e21bf86c69dbc44ec9cd5f
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
