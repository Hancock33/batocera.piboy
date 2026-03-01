################################################################################
#
# libxmp
#
################################################################################
# Version: Commits on Feb 25, 2026
LIBXMP_VERSION = libxmp-4.7.0
LIBXMP_SOURCE = enet-$(LIBXMP_VERSION).tar.gz
LIBXMP_SITE = $(call github,libxmp,libxmp,$(LIBXMP_VERSION))
LIBXMP_INSTALL_STAGING = YES
LIBXMP_AUTORECONF = YES
LIBXMP_DEPENDENCIES = host-pkgconf

$(eval $(autotools-package))
