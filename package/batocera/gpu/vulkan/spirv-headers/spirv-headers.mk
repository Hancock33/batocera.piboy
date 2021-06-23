################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Jun 23, 2021
SPIRV_HEADERS_VERSION = f95c3b3761ee1b1903f54ae69b526ed6f0edc3b9
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
