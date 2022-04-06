################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Apr 06, 2022
SPIRV_HEADERS_VERSION = 9c3fd01c8a91761b6e4be97ff4f13de76e779128
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
