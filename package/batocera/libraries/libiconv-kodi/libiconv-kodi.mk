################################################################################
#
# libiconv-kodi
#
################################################################################

LIBICONV_KODI_VERSION = 1.17
LIBICONV_KODI_SITE = $(BR2_GNU_MIRROR)/libiconv
LIBICONV_KODI_SOURCE = libiconv-$(LIBICONV_KODI_VERSION).tar.gz
LIBICONV_KODI_INSTALL_STAGING = YES
LIBICONV_KODI_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
LIBICONV_KODI_LICENSE_FILES = COPYING COPYING.LIB
LIBICONV_KODI_LIBTOOL_PATCH = NO

LIBICONV_KODI_CONF_OPTS += \
	--prefix=/usr/lib/libiconv-kodi \
	--libdir=/usr/lib/libiconv-kodi/lib \
	--bindir=/usr/iib/libiconv-kodi/bin \
	--disable-shared \
	--enable-extra-encodings

define LIBICONV_KODI_INSTALL_TARGET_CMDS
	$(RM) -rf $(TARGET_DIR)/usr/lib/libiconv-kodi/include
	cp -av  $(TARGET_DIR)/usr/lib/libiconv-kodi/*  $(TARGET_DIR)/usr/
	$(RM) -rf $(TARGET_DIR)/usr/lib/libiconv-kodi
endef


$(eval $(autotools-package))
