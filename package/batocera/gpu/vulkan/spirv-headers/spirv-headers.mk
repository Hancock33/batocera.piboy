################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on May 24, 2023
SPIRV_HEADERS_VERSION = 69155b22b3b1f2d0cfed48f59167d9792de1fd79
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
