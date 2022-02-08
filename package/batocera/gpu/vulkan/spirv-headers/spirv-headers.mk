################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Feb 08, 2022
SPIRV_HEADERS_VERSION = 6a55fade62dec6a406a5a721148f88a2211cbefa
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
