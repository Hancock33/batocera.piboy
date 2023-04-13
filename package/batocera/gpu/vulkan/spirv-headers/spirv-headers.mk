################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Apr 12, 2023
SPIRV_HEADERS_VERSION = cfbe4feef20c3c0628712c2792624f0221e378ac
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
