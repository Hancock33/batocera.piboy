################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Apr 27, 2023
SPIRV_HEADERS_VERSION = 7f1d2f4158704337aff1f739c8e494afc5716e7e
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
