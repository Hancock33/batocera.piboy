################################################################################
#
# bitcoin
#
################################################################################

BITCOIN_VERSION = 0.16.3
BITCOIN_SITE = $(call github,bitcoin,bitcoin,v$(BITCOIN_VERSION))
BITCOIN_AUTORECONF = YES
BITCOIN_LICENSE = MIT
BITCOIN_LICENSE_FILES = COPYING
BITCOIN_DEPENDENCIES = host-pkgconf boost openssl libevent
BITCOIN_CONF_OPTS = \
	--disable-bench \
	--disable-wallet \
	--disable-tests \
	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
	--disable-hardening \
	--without-gui

ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
BITCOIN_DEPENDENCIES += libminiupnpc
BITCOIN_CONF_OPTS += --with-miniupnpc
else
BITCOIN_CONF_OPTS += --without-miniupnpc
endif

$(eval $(autotools-package))
