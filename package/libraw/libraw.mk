################################################################################
#
# libraw
#
################################################################################

LIBRAW_VERSION = 0.17.1
LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
LIBRAW_SITE = http://www.libraw.org/data
LIBRAW_INSTALL_STAGING = YES
# we patch configure.ac
LIBRAW_AUTORECONF = YES
LIBRAW_CONF_OPTS += \
	--disable-examples \
	--disable-lcms \
	--disable-openmp \
	--disable-demosaic-pack-gpl2 \
	--disable-demosaic-pack-gpl3
LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README

ifeq ($(BR2_PACKAGE_JASPER),y)
LIBRAW_CONF_OPTS += --enable-jasper
LIBRAW_DEPENDENCIES += jasper
else
LIBRAW_CONF_OPTS += --disable-jasper
endif

$(eval $(autotools-package))
