################################################################################
#
# pavucontrol_qt
#
################################################################################
# Version: Commits on Apr 17, 2025
PAVUCONTROL_QT_VERSION = 2.2.0
PAVUCONTROL_QT_SITE = $(call github,lxqt,pavucontrol-qt,$(PAVUCONTROL_QT_VERSION))
PAVUCONTROL_QT_LICENSE = BSD-3-Clause
PAVUCONTROL_QT_SUPPORTS_IN_SOURCE_BUILD = NO
PAVUCONTROL_QT_INSTALL_STAGING = YES
PAVUCONTROL_QT_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
