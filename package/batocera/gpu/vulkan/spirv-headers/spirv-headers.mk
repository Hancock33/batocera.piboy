################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 02, 2023
SPIRV_HEADERS_VERSION = f14a663c84e8da4776bd615ac19450aa4d03cd71
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
