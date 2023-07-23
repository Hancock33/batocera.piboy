################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jul 21, 2023
SPIRV_HEADERS_VERSION = 51b106461707f46d962554efe1bf56dee28958a3
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
