################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jul 05, 2023
SPIRV_HEADERS_VERSION = d0006a3938d7acedffb26ab517fe3e95b5288cc6
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
