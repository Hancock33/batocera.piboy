################################################################################
#
# libopenmpt
#
################################################################################
# Version: Commits on Jan 01, 2023
LIBOPENMPT_VERSION = 0.6.7
LIBOPENMPT_SITE =  https://lib.openmpt.org/files/libopenmpt/src
LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
LIBOPENMPT_LICENSE = LGPLv3
LIBOPENMPT_INSTALL_STAGING = YES

$(eval $(autotools-package))
