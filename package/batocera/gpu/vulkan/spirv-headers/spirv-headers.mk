################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Dec 08, 2021
SPIRV_HEADERS_VERSION = d53b49635b7484e86959608a65a64d8121e6a385
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
