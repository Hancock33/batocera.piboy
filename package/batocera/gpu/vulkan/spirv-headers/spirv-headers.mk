################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Sep 22, 2021
SPIRV_HEADERS_VERSION = ae217c17809fadb232ec94b29304b4afcd417bb4
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
