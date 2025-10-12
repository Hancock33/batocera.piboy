################################################################################
#
# libdate
#
################################################################################
# Version: Commits on May 28, 2025
LIBDATE_VERSION = v3.0.4
LIBDATE_SITE =  $(call github,HowardHinnant,date,$(LIBDATE_VERSION))
LIBDATE_INSTALL_STAGING = YES
LIBDATE_INSTALL_TARGET = NO

$(eval $(cmake-package))
