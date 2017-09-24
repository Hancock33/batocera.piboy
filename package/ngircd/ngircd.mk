################################################################################
#
# ngircd
#
################################################################################

NGIRCD_VERSION = 24
NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
NGIRCD_DEPENDENCIES = zlib
NGIRCD_LICENSE = GPL-2.0+
NGIRCD_LICENSE_FILES = COPYING

ifeq ($(BR2_PACKAGE_OPENSSL),y)
NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
NGIRCD_DEPENDENCIES += openssl
else
NGIRCD_CONF_OPTS += --without-openssl
ifeq ($(BR2_PACKAGE_GNUTLS),y)
NGIRCD_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
NGIRCD_DEPENDENCIES += gnutls
else
NGIRCD_CONF_OPTS += --without-gnutls
endif
endif

$(eval $(autotools-package))
