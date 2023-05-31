################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on May 31, 2023
SPIRV_HEADERS_VERSION = 8e2ad27488ed2f87c068c01a8f5e8979f7086405
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
