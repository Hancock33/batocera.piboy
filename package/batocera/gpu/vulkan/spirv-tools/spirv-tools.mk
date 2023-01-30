################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Jan 30, 2023
SPIRV_TOOLS_VERSION = fcfc3c580c75be90a33711dd894dec58ebde9eec
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
