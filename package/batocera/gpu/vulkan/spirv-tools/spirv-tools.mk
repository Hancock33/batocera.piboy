################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Dec 06, 2022
SPIRV_TOOLS_VERSION = 9c6a925c87d4c6e203e440ecc8a57018e5bb8c4b
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
