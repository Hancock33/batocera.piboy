################################################################################
#
# tomlplusplus
#
################################################################################
# Version: Commits on Nov 21, 2026
TOMLPLUSPLUS_VERSION = v3.5.0
TOMLPLUSPLUS_SITE =  $(call github,marzer,tomlplusplus,$(TOMLPLUSPLUS_VERSION))
TOMLPLUSPLUS_LICENSE = MIT license
TOMLPLUSPLUS_LICENSE_FILES = LICENSE
TOMLPLUSPLUS_SUPPORTS_IN_SOURCE_BUILD = NO
TOMLPLUSPLUS_INSTALL_STAGING = YES

$(eval $(meson-package))
