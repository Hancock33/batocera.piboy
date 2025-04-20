################################################################################
#
# lxqt_themes
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_THEMES_VERSION = 2.2.0
LXQT_THEMES_SITE = $(call github,lxqt,lxqt-themes,$(LXQT_THEMES_VERSION))
LXQT_THEMES_LICENSE = BSD-3-Clause
LXQT_THEMES_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_THEMES_INSTALL_STAGING = YES
LXQT_THEMES_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
