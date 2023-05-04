################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on May 03, 2023
SPIRV_HEADERS_VERSION = 268a061764ee69f09a477a695bf6a11ffe311b8d
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
