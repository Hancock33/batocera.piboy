################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Mar 22, 2023
SPIRV_HEADERS_VERSION = 3834d41284f275e8e11f095d5f0fb40ade18abc5
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
