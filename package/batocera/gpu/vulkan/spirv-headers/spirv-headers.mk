################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Feb 23, 2022
SPIRV_HEADERS_VERSION = f75fc98badb2bd585390aeae613a2cdbb2ff3310
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
