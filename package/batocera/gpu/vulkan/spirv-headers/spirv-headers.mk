################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Apr 13, 2022
SPIRV_HEADERS_VERSION = 82becc8a8a92e509d3d8d635889da0a3c17d0606
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
