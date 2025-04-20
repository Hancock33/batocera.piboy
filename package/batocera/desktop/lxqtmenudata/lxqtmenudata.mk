################################################################################
#
# lxqtmenudata
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQTMENUDATA_VERSION = 2.2.0
LXQTMENUDATA_SITE = $(call github,lxqt,lxqt-menu-data,$(LXQTMENUDATA_VERSION))
LXQTMENUDATA_LICENSE =  GPL-3.0
LXQTMENUDATA_SUPPORTS_IN_SOURCE_BUILD = NO
LXQTMENUDATA_INSTALL_STAGING = YES
LXQTMENUDATA_DEPENDENCIES += qt6base lxqtbt

$(eval $(cmake-package))
