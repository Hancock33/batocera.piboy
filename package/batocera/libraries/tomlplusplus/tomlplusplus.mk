################################################################################
#
# tomlplusplus
#
################################################################################
# Version: Commits on Oct 13, 2023
TOMLPLUSPLUS_VERSION = v3.4.0
TOMLPLUSPLUS_SITE =  $(call github,marzer,tomlplusplus,$(TOMLPLUSPLUS_VERSION))
TOMLPLUSPLUS_LICENSE = MIT license
TOMLPLUSPLUS_LICENSE_FILES = LICENSE
TOMLPLUSPLUS_SUPPORTS_IN_SOURCE_BUILD = NO
TOMLPLUSPLUS_INSTALL_STAGING = YES
TOMLPLUSPLUS_INSTALL_TARGET = NO

$(eval $(meson-package))
