################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Mar 23, 2023
SPIRV_HEADERS_VERSION = 90547c54e24e01aae41a68124e7a304d0ec11dd0
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
