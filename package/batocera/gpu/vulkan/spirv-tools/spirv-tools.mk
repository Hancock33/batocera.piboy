################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Feb 17, 2023
SPIRV_TOOLS_VERSION = 69ed5adf108fbd9860f8bcab69b6e80767b8c5aa
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
