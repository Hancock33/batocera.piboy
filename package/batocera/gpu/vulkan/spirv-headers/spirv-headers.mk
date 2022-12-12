################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Dec 12, 2022
SPIRV_HEADERS_VERSION = 70ff9d939cd7fd0c758756ac57ab0c7c6d6c64d6
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
