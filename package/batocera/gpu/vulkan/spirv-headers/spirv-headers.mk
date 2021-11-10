################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Nov 10, 2021
SPIRV_HEADERS_VERSION = 814e728b30ddd0f4509233099a3ad96fd4318c07
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
