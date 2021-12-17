################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Dec 15, 2021
SPIRV_HEADERS_VERSION = eddd4dfc930f1374a70797460240a501c7d333f7
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
