################################################################################
#
# qtermwidget
#
################################################################################
# Version: Commits on Apr 17, 2025
QTERMWIDGET_VERSION = 2.2.0
QTERMWIDGET_SITE = $(call github,lxqt,qtermwidget,$(QTERMWIDGET_VERSION))
QTERMWIDGET_LICENSE = BSD-3-Clause
QTERMWIDGET_SUPPORTS_IN_SOURCE_BUILD = NO
QTERMWIDGET_INSTALL_STAGING = YES
QTERMWIDGET_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
