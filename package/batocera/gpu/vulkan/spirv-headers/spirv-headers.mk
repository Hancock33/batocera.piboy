################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jun 14, 2023
SPIRV_HEADERS_VERSION = 6e09e44cd88a5297433411b2ee52f4cf9f50fa90
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
