################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Nov 16, 2022
SPIRV_HEADERS_VERSION = c214f6f2d1a7253bb0e9f195c2dc5b0659dc99ef
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
