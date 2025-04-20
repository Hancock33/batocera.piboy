################################################################################
#
# lxqt_powermanagement
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_POWERMANAGEMENT_VERSION = 2.2.0
LXQT_POWERMANAGEMENT_SITE = $(call github,lxqt,lxqt-powermanagement,$(LXQT_POWERMANAGEMENT_VERSION))
LXQT_POWERMANAGEMENT_LICENSE = BSD-3-Clause
LXQT_POWERMANAGEMENT_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_POWERMANAGEMENT_INSTALL_STAGING = YES
LXQT_POWERMANAGEMENT_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
