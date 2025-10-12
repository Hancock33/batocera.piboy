################################################################################
#
# tomlplusplus
#
################################################################################
# Version: Commits on Oct 13, 2023
TOMLPLUSPLUS_VERSION = v3.4.0
TOMLPLUSPLUS_SITE =  $(call github,marzer,tomlplusplus,$(TOMLPLUSPLUS_VERSION))
TOMLPLUSPLUS_INSTALL_STAGING = YES

$(eval $(meson-package))
