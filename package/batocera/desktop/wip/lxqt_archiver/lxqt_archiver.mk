################################################################################
#
# lxqt_archiver
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_ARCHIVER_VERSION = 1.2.0
LXQT_ARCHIVER_SITE = $(call github,lxqt,lxqt-archiver,$(LXQT_ARCHIVER_VERSION))
LXQT_ARCHIVER_LICENSE = BSD-3-Clause
LXQT_ARCHIVER_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_ARCHIVER_INSTALL_STAGING = YES
LXQT_ARCHIVER_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
