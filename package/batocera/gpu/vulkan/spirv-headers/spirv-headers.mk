################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jul 28, 2023
SPIRV_HEADERS_VERSION = ae89923fa781650569ca15e5b498a9e4e46ee9c9
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
