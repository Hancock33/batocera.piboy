################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Aug 18, 2022
SPIRV_TOOLS_VERSION = 3c1a14b2b609ae5a352e39ef6b5baf8f64c32ec7
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
