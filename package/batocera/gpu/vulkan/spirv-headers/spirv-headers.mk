################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Mar 02, 2022
SPIRV_HEADERS_VERSION = 0e994ee9c4d4118ae56a7bdb4a7517b6443d2b81
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
