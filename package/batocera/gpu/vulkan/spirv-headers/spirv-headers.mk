################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Oct 06, 2021
SPIRV_HEADERS_VERSION = 5ea2d62e8c0ddd9e2a7d0ca5e3f2335e09e5f408
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
