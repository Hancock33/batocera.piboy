################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 10, 2023
SPIRV_HEADERS_VERSION = b730938c033ede3572b660ab019b438509ba24d9
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
