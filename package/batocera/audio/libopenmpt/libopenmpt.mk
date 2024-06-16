################################################################################
#
# libopenmpt
#
################################################################################
# Version: Commits on Jun 09, 2024
LIBOPENMPT_VERSION = 0.7.8
LIBOPENMPT_SOURCE = libopenmpt-${LIBOPENMPT_VERSION}+release.autotools.tar.gz
LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
LIBOPENMPT_INSTALL_STAGING = YES
LIBOPENMPT_AUTORECONF = YES
LIBOPENMPT_DEPENDENCIES = host-pkgconf zlib host-doxygen mpg123

$(eval $(autotools-package))
