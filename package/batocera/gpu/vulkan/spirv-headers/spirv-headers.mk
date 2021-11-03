################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Nov 03, 2021
SPIRV_HEADERS_VERSION = 29817199b7069bac971e5365d180295d4b077ebe
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
