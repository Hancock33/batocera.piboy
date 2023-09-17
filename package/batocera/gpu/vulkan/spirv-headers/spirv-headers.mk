################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Sept 13, 2023
SPIRV_HEADERS_VERSION = fc7d2462765183c784a0c46beb13eee9e506a067
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
