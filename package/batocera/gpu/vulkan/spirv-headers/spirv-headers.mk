################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Sep 08, 2021
SPIRV_HEADERS_VERSION = 0d3c45cdbb4563b95be9037ea967aac815caf78f
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
