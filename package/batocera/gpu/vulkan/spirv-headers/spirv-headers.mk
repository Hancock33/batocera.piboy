################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Jul 14, 2021
SPIRV_HEADERS_VERSION = 1d4e3a7e3a04ba205ed8cb1485f7cb7369bec609
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
