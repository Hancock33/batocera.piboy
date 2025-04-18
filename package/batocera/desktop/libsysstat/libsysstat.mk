################################################################################
#
# libsysstat
#
################################################################################
# Version: Commits on Nov 05, 2024
LIBSYSSTAT_VERSION = 1.1.0
LIBSYSSTAT_SITE = $(call github,lxqt,libsysstat,$(LIBSYSSTAT_VERSION))
LIBSYSSTAT_LICENSE =  GPL-3.0
LIBSYSSTAT_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSYSSTAT_INSTALL_STAGING = YES
LIBSYSSTAT_DEPENDENCIES += qt6base liblxqt

$(eval $(cmake-package))
