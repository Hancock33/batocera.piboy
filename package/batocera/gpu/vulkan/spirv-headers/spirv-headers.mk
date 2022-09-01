################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Sept 01, 2022
SPIRV_HEADERS_VERSION = 87d5b782bec60822aa878941e6b13c0a9a954c9b
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
