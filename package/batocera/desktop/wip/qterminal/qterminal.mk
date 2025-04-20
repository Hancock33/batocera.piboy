################################################################################
#
# qterminal
#
################################################################################
# Version: Commits on Apr 17, 2025
QTERMINAL_VERSION = 2.2.0
QTERMINAL_SITE = $(call github,lxqt,qterminal,$(QTERMINAL_VERSION))
QTERMINAL_LICENSE = BSD-3-Clause
QTERMINAL_SUPPORTS_IN_SOURCE_BUILD = NO
QTERMINAL_INSTALL_STAGING = YES
QTERMINAL_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
