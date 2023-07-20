################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jul 19, 2023
SPIRV_HEADERS_VERSION = 14914db17a1fc16e06c4e49e5353bb80b3267e9c
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
