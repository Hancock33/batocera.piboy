################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on May 25, 2022
SPIRV_HEADERS_VERSION = 5a121866927a16ab9d49bed4788b532c7fcea766
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
