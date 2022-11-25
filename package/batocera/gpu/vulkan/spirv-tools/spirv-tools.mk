################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Nov 25, 2022
SPIRV_TOOLS_VERSION = 9a6f4121f4a49fa3b3d8ddafc43cb519f7a6e1fc
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
