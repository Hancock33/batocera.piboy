################################################################################
#
# lxqt_qtplugin
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_QTPLUGIN_VERSION = 2.2.0
LXQT_QTPLUGIN_SITE = $(call github,lxqt,lxqt-qtplugin,$(LXQT_QTPLUGIN_VERSION))
LXQT_QTPLUGIN_LICENSE = BSD-3-Clause
LXQT_QTPLUGIN_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_QTPLUGIN_INSTALL_STAGING = YES
LXQT_QTPLUGIN_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
