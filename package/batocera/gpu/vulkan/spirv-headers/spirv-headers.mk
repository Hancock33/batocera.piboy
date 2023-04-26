################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Apr 26, 2023
SPIRV_HEADERS_VERSION = e08a279cf9448085b920764db1bf27658b208795
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
