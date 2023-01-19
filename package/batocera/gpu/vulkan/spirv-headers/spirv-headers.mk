################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jan 18, 2023
SPIRV_HEADERS_VERSION = aa331ab0ffcb3a67021caa1a0c1c9017712f2f31
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
