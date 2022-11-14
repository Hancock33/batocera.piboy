################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Nov 14, 2022
SPIRV_TOOLS_VERSION = 8ea3ae6be2b2409e6c44eba3c17006e2fa0845f2
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
