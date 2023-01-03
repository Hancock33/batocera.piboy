################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jan 03, 2023
SPIRV_HEADERS_VERSION = c16439f4268a9de088ac7c67b6206ade4b28d53a
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
