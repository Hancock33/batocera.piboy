################################################################################
#
# lxqt_session
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_SESSION_VERSION = 2.2.0
LXQT_SESSION_SITE = $(call github,lxqt,lxqt-session,$(LXQT_SESSION_VERSION))
LXQT_SESSION_LICENSE = BSD-3-Clause
LXQT_SESSION_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_SESSION_INSTALL_STAGING = YES
LXQT_SESSION_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
