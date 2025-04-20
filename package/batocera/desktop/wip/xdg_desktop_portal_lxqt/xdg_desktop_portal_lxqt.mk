################################################################################
#
# xdg_desktop_portal_lxqt
#
################################################################################
# Version: Commits on Apr 17, 2025
XDG_DESKTOP_PORTAL_LXQT_VERSION = 1.2.0
XDG_DESKTOP_PORTAL_LXQT_SITE = $(call github,lxqt,xdg-desktop-portal-lxqt,$(XDG_DESKTOP_PORTAL_LXQT_VERSION))
XDG_DESKTOP_PORTAL_LXQT_LICENSE = BSD-3-Clause
XDG_DESKTOP_PORTAL_LXQT_SUPPORTS_IN_SOURCE_BUILD = NO
XDG_DESKTOP_PORTAL_LXQT_INSTALL_STAGING = YES
XDG_DESKTOP_PORTAL_LXQT_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
