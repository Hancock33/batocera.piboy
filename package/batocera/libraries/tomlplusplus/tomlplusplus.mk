################################################################################
#
# tomlplusplus
#
################################################################################
# Version: Commits on Nov 21, 2026
TOMLPLUSPLUS_VERSION = v3.5.0
TOMLPLUSPLUS_SITE = $(call github,marzer,tomlplusplus,$(TOMLPLUSPLUS_VERSION))
TOMLPLUSPLUS_LICENSE = MIT
TOMLPLUSPLUS_LICENSE_FILES = LICENSE
TOMLPLUSPLUS_INSTALL_STAGING = YES

$(eval $(meson-package))
