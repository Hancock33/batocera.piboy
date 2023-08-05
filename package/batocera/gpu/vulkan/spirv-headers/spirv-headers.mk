################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 04, 2023
SPIRV_HEADERS_VERSION = 124a9665e464ef98b8b718d572d5f329311061eb
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
