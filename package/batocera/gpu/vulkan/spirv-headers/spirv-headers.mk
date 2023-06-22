################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jun 21, 2023
SPIRV_HEADERS_VERSION = 10db9d4e194246a020a4148e220837ac7c68cfd9
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
