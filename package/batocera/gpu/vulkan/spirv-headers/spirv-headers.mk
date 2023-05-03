################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on May 03, 2023
SPIRV_HEADERS_VERSION = f7e1a2ef5630417e70a6286011edf9a6e4b725c3
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
