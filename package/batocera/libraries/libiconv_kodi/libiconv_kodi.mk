################################################################################
#
# libiconv_kodi
#
################################################################################

LIBICONV_KODI_VERSION = 1.15
LIBICONV_KODI_SOURCE = libiconv-${LIBICONV_KODI_VERSION}.tar.gz
LIBICONV_KODI_SITE = $(BR2_GNU_MIRROR)/libiconv
LIBICONV_KODI_INSTALL_STAGING = YES
LIBICONV_KODI_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
LIBICONV_KODI_LICENSE_FILES = COPYING COPYING.LIB

LIBICONV_KODI_CONF_OPTS += --enable-extra-encodings --prefix=/usr/local --exec_prefix=/usr/local --libdir=/usr/local/lib

define LIBICONV_KODI_DISABLE_PRELOAD
	$(SED) '/preload/d' $(@D)/Makefile.in
endef
LIBICONV_KODI_PRE_CONFIGURE_HOOKS += LIBICONV_KODI_DISABLE_PRELOAD

define LIBICONV_KODI_MOVE_LIBS
		rm $(TARGET_DIR)/usr/local/lib/{*.a,*.la,charset.alias}
		mv $(TARGET_DIR)/usr/local/lib/lib* $(TARGET_DIR)/usr/lib
		rm -rf $(TARGET_DIR)/usr/local
endef
LIBICONV_KODI_POST_INSTALL_TARGET_HOOKS += LIBICONV_KODI_MOVE_LIBS

$(eval $(autotools-package))
