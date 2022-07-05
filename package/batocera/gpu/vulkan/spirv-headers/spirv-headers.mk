################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jul 05, 2022
SPIRV_HEADERS_VERSION = 0bcc624926a25a2a273d07877fd25a6ff5ba1cfb
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
