################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Mar 08, 2023
SPIRV_HEADERS_VERSION = 1feaf4414eb2b353764d01d88f8aa4bcc67b60db
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
