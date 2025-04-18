################################################################################
#
# polkitqt
#
################################################################################
# Version: Commits on Feb 21, 2024
POLKITQT_VERSION = v0.200.0
POLKITQT_SITE = $(call github,KDE,polkit-qt-1,$(POLKITQT_VERSION))
POLKITQT_LICENSE =  GPL-3.0
POLKITQT_SUPPORTS_IN_SOURCE_BUILD = NO
POLKITQT_INSTALL_STAGING = YES
POLKITQT_DEPENDENCIES += qt6base polkit

POLKITQT_CONF_OPTS += -DQT_MAJOR_VERSION=6

$(eval $(cmake-package))
