################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Dec 01, 2022
SPIRV_HEADERS_VERSION = 1d31a100405cf8783ca7a31e31cdd727c9fc54c3
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
