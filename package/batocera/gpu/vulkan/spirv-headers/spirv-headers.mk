################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on May 17, 2023
SPIRV_HEADERS_VERSION = bdbfd019be6952fd8fa9bd5606a8798a7530c853
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
