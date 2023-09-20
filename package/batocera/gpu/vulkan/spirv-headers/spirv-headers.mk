################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Sept 20, 2023
SPIRV_HEADERS_VERSION = 79743b899fde5c954897b2694291002626358fac
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
