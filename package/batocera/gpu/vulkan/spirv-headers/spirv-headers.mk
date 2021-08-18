################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Aug 18, 2021
SPIRV_HEADERS_VERSION = 449bc986ba6f4c5e10e32828783f9daef2a77644
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
