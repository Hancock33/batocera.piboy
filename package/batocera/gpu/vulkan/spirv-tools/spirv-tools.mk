################################################################################
#
# spirv-tools
#
################################################################################
# Version.: Commits on Feb 03, 2022
SPIRV_TOOLS_VERSION = 845f3efb8a4eb32e5f484aa6ea9b9e3716d6f7ec
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)"

$(eval $(cmake-package))
