################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Oct 05, 2022
SPIRV_HEADERS_VERSION = 85a1ed200d50660786c1a88d9166e871123cce39
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
