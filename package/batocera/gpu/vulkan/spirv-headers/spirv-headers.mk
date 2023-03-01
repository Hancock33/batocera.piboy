################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Mar 01, 2023
SPIRV_HEADERS_VERSION = 295cf5fb3bfe2454360e82b26bae7fc0de699abe
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
