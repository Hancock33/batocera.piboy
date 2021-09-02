################################################################################
#
# LIBXMP
#
################################################################################
# Version.: Commits on Aug 21, 2021
LIBXMP_VERSION = 8d64ac5d69eb69531de29bda76cd54990c5b78a3
LIBXMP_SOURCE = enet-${LIBXMP_VERSION}.tar.gz
LIBXMP_SITE =  $(call github,libxmp,libxmp,$(LIBXMP_VERSION))
LIBXMP_INSTALL_STAGING = YES
LIBXMP_AUTORECONF = YES
LIBXMP_DEPENDENCIES = host-pkgconf

$(eval $(autotools-package))
