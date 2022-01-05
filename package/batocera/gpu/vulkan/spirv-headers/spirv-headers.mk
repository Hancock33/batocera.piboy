################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Jan 05, 2022
SPIRV_HEADERS_VERSION = b8047fbe45f426f5918fadc67e8408f5b108c3c9
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
