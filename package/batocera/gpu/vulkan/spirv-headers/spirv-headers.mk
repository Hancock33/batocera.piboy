################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 16, 2023
SPIRV_HEADERS_VERSION = b8b9eb8640c8c0107ba580fbcb10f969022ca32c
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
