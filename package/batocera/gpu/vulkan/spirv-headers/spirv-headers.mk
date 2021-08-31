################################################################################
#
# spirv-headers
#
################################################################################
# Version.: Commits on Aug 30, 2021
SPIRV_HEADERS_VERSION = 6cae8216a6ea19ff3f237af01e54378c1ff81fcd
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
