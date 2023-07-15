################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jul 12, 2023
SPIRV_HEADERS_VERSION = f1ba373ef03752ee9f6f2b898bea1213f93e1ef2
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
