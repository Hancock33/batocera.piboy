################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Apr 20, 2022
SPIRV_HEADERS_VERSION = 46b7918218d02b678b9405da538928a0f2c286bb
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
