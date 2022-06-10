################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jun 08, 2022
SPIRV_HEADERS_VERSION = 36c0c1596225e728bd49abb7ef56a3953e7ed468
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
