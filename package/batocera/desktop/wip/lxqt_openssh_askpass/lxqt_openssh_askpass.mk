################################################################################
#
# lxqt_openssh_askpass
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_OPENSSH_ASKPASS_VERSION = 2.2.0
LXQT_OPENSSH_ASKPASS_SITE = $(call github,lxqt,lxqt-openssh-askpass,$(LXQT_OPENSSH_ASKPASS_VERSION))
LXQT_OPENSSH_ASKPASS_LICENSE = BSD-3-Clause
LXQT_OPENSSH_ASKPASS_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_OPENSSH_ASKPASS_INSTALL_STAGING = YES
LXQT_OPENSSH_ASKPASS_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
