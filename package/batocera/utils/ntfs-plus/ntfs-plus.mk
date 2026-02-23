################################################################################
#
# ntfs-plus
#
################################################################################
# Version: Commits on Oct 16, 2025
NTFS_PLUS_VERSION = 1.0.0
NTFS_PLUS_SITE = $(call github,ntfsprogs-plus,ntfsprogs-plus,$(NTFS_PLUS_VERSION))
NTFS_PLUS_CONF_OPTS = --disable-ldconfig
NTFS_PLUS_INSTALL_STAGING = YES
NTFS_PLUS_DEPENDENCIES = host-pkgconf
NTFS_PLUS_LICENSE = GPL-2.0+, LGPL-2.0+
NTFS_PLUS_LICENSE_FILES = COPYING COPYING.LIB
NTFS_PLUS_AUTORECONF = YES

ifeq ($(BR2_PACKAGE_LIBFUSE),y)
NTFS_PLUS_CONF_OPTS += --with-fuse=external
NTFS_PLUS_DEPENDENCIES += libfuse
endif

ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
NTFS_PLUS_DEPENDENCIES += util-linux
endif

ifeq ($(BR2_PACKAGE_NTFS_PLUS_ENCRYPTED),y)
NTFS_PLUS_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
NTFS_PLUS_CONF_OPTS += --enable-crypto
NTFS_PLUS_DEPENDENCIES += gnutls libgcrypt
endif

ifneq ($(BR2_PACKAGE_NTFS_PLUS_NTFSPROGS),y)
NTFS_PLUS_CONF_OPTS += --disable-ntfsprogs
endif

$(eval $(autotools-package))
