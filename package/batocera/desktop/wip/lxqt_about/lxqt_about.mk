################################################################################
#
# lxqt_about
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_ABOUT_VERSION = 2.2.0
LXQT_ABOUT_SITE = $(call github,lxqt,lxqt-about,$(LXQT_ABOUT_VERSION))
LXQT_ABOUT_LICENSE = BSD-3-Clause
LXQT_ABOUT_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_ABOUT_INSTALL_STAGING = YES
LXQT_ABOUT_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
