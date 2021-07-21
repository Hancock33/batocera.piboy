################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Jul 21, 2021
SPIRV_HEADERS_VERSION = cf653e4ca4858583802b0d1656bc934edff6bd7f
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
