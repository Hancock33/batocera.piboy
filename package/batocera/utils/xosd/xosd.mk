################################################################################
#
# xosd
#
################################################################################
# Version: Commits on Jul 05, 2021
XOSD_VERSION = 1.1.0
XOSD_SOURCE = xosd-$(XOSD_VERSION).tar.gz
XOSD_SITE = $(call github,kdmurthy,libxosd-xft,$(XOSD_VERSION))

XOSD_DEPENDENCIES = xserver_xorg-server

$(eval $(autotools-package))
