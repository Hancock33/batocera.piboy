################################################################################
#
# liblxqt
#
################################################################################
# Version: Commits on Apr 17, 2025
LIBLXQT_VERSION = 2.2.0
LIBLXQT_SITE = $(call github,lxqt,liblxqt,$(LIBLXQT_VERSION))
LIBLXQT_LICENSE = BSD-3-Clause
LIBLXQT_SUPPORTS_IN_SOURCE_BUILD = NO
LIBLXQT_INSTALL_STAGING = YES
LIBLXQT_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
