################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Apr 19, 2022
SPIRV_TOOLS_VERSION = 2b2b0282af25779a5ae5dfc08a1c4e3be5a8ae17
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
