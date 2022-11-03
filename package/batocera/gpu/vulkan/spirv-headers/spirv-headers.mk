################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Nov 03, 2022
SPIRV_HEADERS_VERSION = 747031e10dea9e6c5651bf11957a9dbcd379fa47
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
