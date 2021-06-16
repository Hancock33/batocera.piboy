################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Jun 16, 2021
SPIRV_HEADERS_VERSION = 07f259e68af3a540038fa32df522554e74f53ed5
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
