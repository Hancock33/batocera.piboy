################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Mar 23, 2023
SPIRV_HEADERS_VERSION = 5b21f14b20af8b07cc81f01bef627d562730e7c8
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
