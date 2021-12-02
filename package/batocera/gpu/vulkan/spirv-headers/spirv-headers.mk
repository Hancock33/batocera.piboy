################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Dec 01, 2021
SPIRV_HEADERS_VERSION = 29414ae1fd07a43cf8fe29b4437bfe8475cdd0d8
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
