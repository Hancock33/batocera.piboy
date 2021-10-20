################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Oct 20, 2021
SPIRV_HEADERS_VERSION = 92f21c9b214178ce67cf1e31a00a33312590403a
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
