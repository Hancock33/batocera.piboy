################################################################################
#
# lxqt_admin
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_ADMIN_VERSION = 2.2.0
LXQT_ADMIN_SITE = $(call github,lxqt,lxqt-admin,$(LXQT_ADMIN_VERSION))
LXQT_ADMIN_LICENSE = BSD-3-Clause
LXQT_ADMIN_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_ADMIN_INSTALL_STAGING = YES
LXQT_ADMIN_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
