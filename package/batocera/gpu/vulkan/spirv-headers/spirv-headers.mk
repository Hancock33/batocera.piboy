################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jun 22, 2023
SPIRV_HEADERS_VERSION = 3469b164e25cee24435029a569933cb42578db5d
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
