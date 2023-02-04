################################################################################
#
# libxmp
#
################################################################################
# Version: Commits on Jan 21, 2023
LIBXMP_VERSION = bb3a502c10b9c16961c72ee72c5c14296d3109f5
LIBXMP_SITE =  $(call github,libxmp,libxmp,$(LIBXMP_VERSION))
LIBXMP_INSTALL_STAGING = YES
LIBXMP_AUTORECONF = YES
LIBXMP_DEPENDENCIES = host-pkgconf

$(eval $(autotools-package))
