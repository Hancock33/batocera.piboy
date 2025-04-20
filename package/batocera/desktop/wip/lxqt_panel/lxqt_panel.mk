################################################################################
#
# lxqt_panel
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_PANEL_VERSION = 2.2.0
LXQT_PANEL_SITE = $(call github,lxqt,lxqt-panel,$(LXQT_PANEL_VERSION))
LXQT_PANEL_LICENSE = BSD-3-Clause
LXQT_PANEL_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_PANEL_INSTALL_STAGING = YES
LXQT_PANEL_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
