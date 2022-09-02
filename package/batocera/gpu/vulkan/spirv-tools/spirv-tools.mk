################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Sept 02, 2022
SPIRV_TOOLS_VERSION = 4c456f7da67c5437a6fb7d4d20d78e2a5ae2acf2
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
