################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Sept 21, 2022
SPIRV_HEADERS_VERSION = 4bd8fc0c8c266ecc6fc50193e65fe6a2fff8e4bc
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
