################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Mar 16, 2022
SPIRV_HEADERS_VERSION = 4995a2f2723c401eb0ea3e10c81298906bf1422b
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
