################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Jun 30, 2021
SPIRV_HEADERS_VERSION = ddf3230c14c71e81fc0eae9b781cc4bcc2d1f0f5
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
