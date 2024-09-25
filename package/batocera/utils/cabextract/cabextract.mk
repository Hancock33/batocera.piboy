################################################################################
#
# cabextract
#
################################################################################
# Version: Commits on Feb 24, 2023
CABEXTRACT_VERSION = 1.11
CABEXTRACT_SITE =  $(call github,kyz,libmspack,v$(LIBMSPACK_VERSION))
CABEXTRACT_LICENSE = LGPL-2.1
CABEXTRACT_LICENSE_FILES = COPYING.LIB
CABEXTRACT_SUBDIR = cabextract
CABEXTRACT_AUTORECONF = YES
CABEXTRACT_INSTALL_STAGING = YES

CABEXTRACT_CONF_OPTS = --with-external-libmspack

$(eval $(autotools-package))
$(eval $(host-autotools-package))
