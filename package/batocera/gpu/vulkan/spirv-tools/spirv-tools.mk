################################################################################
#
# spirv-tools
#
################################################################################
# Version.: Commits on Feb 16, 2022
SPIRV_TOOLS_VERSION = d18d0d92e55f44da6af0dc87fb0e3c8034e9a3ac
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
