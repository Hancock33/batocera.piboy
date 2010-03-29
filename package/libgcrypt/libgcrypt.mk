#############################################################
#
# libgcrypt
#
#############################################################
LIBGCRYPT_VERSION:=1.4.5
LIBGCRYPT_SOURCE:=libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
LIBGCRYPT_SITE:=ftp://ftp.gnupg.org/gcrypt/libgcrypt
LIBGCRYPT_INSTALL_STAGING = YES
LIBGCRYPT_INSTALL_TARGET = YES

LIBGCRYPT_CONF_ENV = \
	ac_cv_sys_symbol_underscore=no
LIBGCRYPT_CONF_OPT = \
	--disable-optimization

LIBGCRYPT_DEPENDENCIES = libgpg-error

$(eval $(call AUTOTARGETS,package,libgcrypt))
