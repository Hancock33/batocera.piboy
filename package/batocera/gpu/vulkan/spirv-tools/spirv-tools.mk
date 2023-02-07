################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Feb 06, 2023
SPIRV_TOOLS_VERSION = 0ce2bc4ce0ac768b86047a85f31ccb5ea3263f31
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
