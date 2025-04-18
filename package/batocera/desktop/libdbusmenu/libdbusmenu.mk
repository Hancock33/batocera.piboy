################################################################################
#
# libdbusmenu
#
################################################################################
# Version: Commits on Apr 17, 2025
LIBDBUSMENU_VERSION = 0.3.0
LIBDBUSMENU_SITE = $(call github,lxqt,libdbusmenu-lxqt,$(LIBDBUSMENU_VERSION))
LIBDBUSMENU_LICENSE =  GPL-3.0
LIBDBUSMENU_SUPPORTS_IN_SOURCE_BUILD = NO
LIBDBUSMENU_INSTALL_STAGING = YES
LIBDBUSMENU_DEPENDENCIES += liblxqt

$(eval $(cmake-package))
