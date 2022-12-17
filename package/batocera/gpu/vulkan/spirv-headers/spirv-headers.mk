################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Dec 15, 2022
SPIRV_HEADERS_VERSION = 34d04647d384e0aed037e7a2662a655fc39841bb
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
