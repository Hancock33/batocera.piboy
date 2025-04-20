################################################################################
#
# lxqt_notificationd
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_NOTIFICATIOND_VERSION = 2.2.0
LXQT_NOTIFICATIOND_SITE = $(call github,lxqt,lxqt-notificationd,$(LXQT_NOTIFICATIOND_VERSION))
LXQT_NOTIFICATIOND_LICENSE = BSD-3-Clause
LXQT_NOTIFICATIOND_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_NOTIFICATIOND_INSTALL_STAGING = YES
LXQT_NOTIFICATIOND_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
