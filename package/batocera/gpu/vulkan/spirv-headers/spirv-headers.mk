################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Nov 30, 2022
SPIRV_HEADERS_VERSION = 1ebdaf08584e88a850f8bb420dffa4f69b53427c
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
