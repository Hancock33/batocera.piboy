################################################################################
#
# libgeotiff
#
################################################################################

LIBGEOTIFF_VERSION = 1.5.1
LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
LIBGEOTIFF_LICENSE = X11-style, public domain
LIBGEOTIFF_LICENSE_FILES = LICENSE
LIBGEOTIFF_DEPENDENCIES = proj tiff host-pkgconf
LIBGEOTIFF_INSTALL_STAGING = YES
LIBGEOTIFF_CONF_OPTS = --with-proj=$(STAGING_DIR)/usr

ifeq ($(BR2_PACKAGE_ZLIB),y)
LIBGEOTIFF_DEPENDENCIES += zlib
LIBGEOTIFF_CONF_OPTS += --with-zlib
else
LIBGEOTIFF_CONF_OPTS += --without-zlib
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
LIBGEOTIFF_DEPENDENCIES += jpeg
LIBGEOTIFF_CONF_OPTS += --with-jpeg
else
LIBGEOTIFF_CONF_OPTS += --without-jpeg
endif

$(eval $(autotools-package))
