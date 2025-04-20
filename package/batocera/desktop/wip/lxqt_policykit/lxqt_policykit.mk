################################################################################
#
# lxqt_policykit
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_POLICYKIT_VERSION = 2.2.0
LXQT_POLICYKIT_SITE = $(call github,lxqt,lxqt-policykit,$(LXQT_POLICYKIT_VERSION))
LXQT_POLICYKIT_LICENSE = BSD-3-Clause
LXQT_POLICYKIT_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_POLICYKIT_INSTALL_STAGING = YES
LXQT_POLICYKIT_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
