################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 24, 2022
SPIRV_HEADERS_VERSION = 93754d52d6cbbfd61f4e87571079e8a28e65f8ca
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
