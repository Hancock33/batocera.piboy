################################################################################
#
# screengrab
#
################################################################################
# Version: Commits on Apr 17, 2025
SCREENGRAB_VERSION = 2.10.0
SCREENGRAB_SITE = $(call github,lxqt,screengrab,$(SCREENGRAB_VERSION))
SCREENGRAB_LICENSE = BSD-3-Clause
SCREENGRAB_SUPPORTS_IN_SOURCE_BUILD = NO
SCREENGRAB_INSTALL_STAGING = YES
SCREENGRAB_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
