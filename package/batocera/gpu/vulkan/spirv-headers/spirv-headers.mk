################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Aug 11, 2021
SPIRV_HEADERS_VERSION = e71feddb3f17c5586ff7f4cfb5ed1258b800574b
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
