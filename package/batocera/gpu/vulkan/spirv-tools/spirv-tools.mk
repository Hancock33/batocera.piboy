################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Mar 04, 2023
SPIRV_TOOLS_VERSION = 016bb3ae7f2bea7c86c25fa1d6d4df47b78700fd
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
