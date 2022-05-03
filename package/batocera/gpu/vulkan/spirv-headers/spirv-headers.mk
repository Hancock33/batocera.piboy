################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on May 03, 2022
SPIRV_HEADERS_VERSION = b765c355f488837ca4c77980ba69484f3ff277f5
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))

# Only installs header files
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
