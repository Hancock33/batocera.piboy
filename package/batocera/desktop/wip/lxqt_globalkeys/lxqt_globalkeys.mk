################################################################################
#
# lxqt_globalkeys
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_GLOBALKEYS_VERSION = 2.2.0
LXQT_GLOBALKEYS_SITE = $(call github,lxqt,lxqt-globalkeys,$(LXQT_GLOBALKEYS_VERSION))
LXQT_GLOBALKEYS_LICENSE = BSD-3-Clause
LXQT_GLOBALKEYS_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_GLOBALKEYS_INSTALL_STAGING = YES
LXQT_GLOBALKEYS_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
