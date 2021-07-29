################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Jul 28, 2021
SPIRV_HEADERS_VERSION = e7b49d7fb59808a650618e0a4008d4bae927e112
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
