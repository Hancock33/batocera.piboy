################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Mar 29, 2023
SPIRV_HEADERS_VERSION = 29ba2493125effc581532518add689613cebfec7
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
