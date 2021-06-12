################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Jun 09, 2021
SPIRV_HEADERS_VERSION = f5417a4b6633c3217c9a1bc2f0c70b1454975ba7
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
