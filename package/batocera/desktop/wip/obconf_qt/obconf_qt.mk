################################################################################
#
# obconf_qt
#
################################################################################
# Version: Commits on Nov 01, 2024
OBCONF_QT_VERSION = 0.16.5
OBCONF_QT_SITE = $(call github,lxqt,obconf-qt,$(OBCONF_QT_VERSION))
OBCONF_QT_LICENSE = BSD-3-Clause
OBCONF_QT_SUPPORTS_IN_SOURCE_BUILD = NO
OBCONF_QT_INSTALL_STAGING = YES
OBCONF_QT_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
