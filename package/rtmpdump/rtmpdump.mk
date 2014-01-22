################################################################################
#
# rtmpdump
#
################################################################################

RTMPDUMP_VERSION = e0056c51cc1710c9a44d2a2c4e2f344fa9cabcf4
RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
RTMPDUMP_INSTALL_STAGING = YES
# Note that rtmpdump is GPLv2 but librtmp has its own license and since we only
# care about librtmp, it's LGPLv2.1+
RTMPDUMP_LICENSE = LGPLv2.1+
RTMPDUMP_LICENSE_FILES = librtmp/COPYING
RTMPDUMP_DEPENDENCIES = zlib

ifeq ($(BR2_PACKAGE_GNUTLS),y)
    RTMPDUMP_DEPENDENCIES += gnutls
    RTMPDUMP_CRYPTO = GNUTLS
else ifeq ($(BR2_PACKAGE_POLARSSL),y)
    RTMPDUMP_DEPENDENCIES += polarssl
    RTMPDUMP_CRYPTO = POLARSSL
else
    RTMPDUMP_DEPENDENCIES += openssl
    RTMPDUMP_CRYPTO = OPENSSL
endif

RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)

ifneq ($(BR2_PREFER_STATIC_LIB),y)
    RTMPDUMP_CFLAGS += -fPIC
endif

define RTMPDUMP_BUILD_CMDS
	$(MAKE) CRYPTO=$(RTMPDUMP_CRYPTO) \
		prefix=/usr \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(RTMPDUMP_CFLAGS)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		-C $(@D)/librtmp
endef

define RTMPDUMP_INSTALL_STAGING_CMDS
	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR)
endef

define RTMPDUMP_INSTALL_TARGET_CMDS
	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR)
endef

$(eval $(generic-package))
