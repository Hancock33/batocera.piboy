################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 10, 2023
SPIRV_HEADERS_VERSION = 45fc02a6c67016b3e5ff6e4896a61544a40f90f8
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
