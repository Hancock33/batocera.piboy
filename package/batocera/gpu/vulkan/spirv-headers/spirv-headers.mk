################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jun 01, 2022
SPIRV_HEADERS_VERSION = b2a156e1c0434bc8c99aaebba1c7be98be7ac580
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
