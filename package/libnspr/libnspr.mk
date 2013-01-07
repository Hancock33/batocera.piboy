#############################################################
#
# libnspr
#
#############################################################
LIBNSPR_VERSION = 4.9.2
LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
LIBNSPR_SUBDIR = mozilla/nsprpub
LIBNSPR_INSTALL_STAGING = YES
# Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
		   HOST_LDFLAGS="-lc"
# NSPR mixes up --build and --host
LIBNSPR_CONF_OPT  = --host=$(GNU_HOST_NAME)
LIBNSPR_CONF_OPT += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
LIBNSPR_CONF_OPT += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6

ifeq ($(BR2_arm),y)
ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
LIBNSPR_CONF_OPT += --enable-thumb2
else
LIBNSPR_CONF_OPT += --disable-thumb2
endif
endif

define LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
		$(STAGING_DIR)/usr/bin/nspr-config
endef

LIBNSPR_POST_INSTALL_STAGING_HOOKS += LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP

$(eval $(autotools-package))
