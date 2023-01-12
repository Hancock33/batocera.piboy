################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Jan 11, 2023
SPIRV_TOOLS_VERSION = 7e8813bb4cf32fd9c4d696c09d4e68e17a8f57f1
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
