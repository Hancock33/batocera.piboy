################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Nov 04, 2022
SPIRV_HEADERS_VERSION = 47f2465ee3e78ec5ec38f00b2c405d9475797228
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
