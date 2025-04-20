################################################################################
#
# lxqt_config
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_CONFIG_VERSION = 2.2.0
LXQT_CONFIG_SITE = $(call github,lxqt,lxqt-config,$(LXQT_CONFIG_VERSION))
LXQT_CONFIG_LICENSE = BSD-3-Clause
LXQT_CONFIG_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_CONFIG_INSTALL_STAGING = YES
LXQT_CONFIG_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
