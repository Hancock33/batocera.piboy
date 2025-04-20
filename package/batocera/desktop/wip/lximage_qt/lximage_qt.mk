################################################################################
#
# lximage_qt
#
################################################################################
# Version: Commits on Apr 17, 2025
LXIMAGE_QT_VERSION = 2.2.0
LXIMAGE_QT_SITE = $(call github,lxqt,lximage-qt,$(LXIMAGE_QT_VERSION))
LXIMAGE_QT_LICENSE = BSD-3-Clause
LXIMAGE_QT_SUPPORTS_IN_SOURCE_BUILD = NO
LXIMAGE_QT_INSTALL_STAGING = YES
LXIMAGE_QT_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
