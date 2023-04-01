################################################################################
#
# libopenmpt
#
################################################################################

# needed for kodi20-audiodecoder-openmpt
LIBOPENMPT_VERSION = 0.6.9
LIBOPENMPT_SOURCE = libopenmpt-${LIBOPENMPT_VERSION}+release.autotools.tar.gz
LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
LIBOPENMPT_INSTALL_STAGING = YES
LIBOPENMPT_AUTORECONF = YES
LIBOPENMPT_DEPENDENCIES = host-pkgconf zlib host-doxygen

$(eval $(autotools-package))
