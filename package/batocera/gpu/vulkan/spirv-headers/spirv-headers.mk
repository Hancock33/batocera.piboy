################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jan 04, 2023
SPIRV_HEADERS_VERSION = d13b52222c39a7e9a401b44646f0ca3a640fbd47
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
