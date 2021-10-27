################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Oct 27, 2021
SPIRV_HEADERS_VERSION = 1380cbbec10756b492e9397d03c4250887e15090
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
