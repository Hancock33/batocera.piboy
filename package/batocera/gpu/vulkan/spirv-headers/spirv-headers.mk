################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Sep 10, 2021
SPIRV_HEADERS_VERSION = 635049b5e1451d846d5d307def8c78328aaeb342
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
