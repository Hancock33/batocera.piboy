################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jul 19, 2023
SPIRV_HEADERS_VERSION = 88d56db61c3a53451a4299b5a6811fb9a994eb32
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
