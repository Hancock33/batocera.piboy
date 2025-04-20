################################################################################
#
# lxqt_sudo
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_SUDO_VERSION = 2.2.0
LXQT_SUDO_SITE = $(call github,lxqt,lxqt-sudo,$(LXQT_SUDO_VERSION))
LXQT_SUDO_LICENSE = BSD-3-Clause
LXQT_SUDO_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_SUDO_INSTALL_STAGING = YES
LXQT_SUDO_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
