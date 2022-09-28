################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Sept 27, 2022
SPIRV_TOOLS_VERSION = e1a8b5d60dbf44aa76913d86dae203b7e2dbc884
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
