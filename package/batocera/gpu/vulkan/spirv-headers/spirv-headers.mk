################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 23, 2023
SPIRV_HEADERS_VERSION = d790ced752b5bfc06b6988baadef6eb2d16bdf96
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
