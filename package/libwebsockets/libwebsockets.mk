################################################################################
#
# libwebsockets
#
################################################################################

LIBWEBSOCKETS_VERSION = v1.1-chrome26-firefox18
LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
LIBWEBSOCKETS_LICENSE = LGPLv2.1
LIBWEBSOCKETS_LICENSE_FILES = COPYING
LIBWEBSOCKETS_DEPENDENCIES = zlib
LIBWEBSOCKETS_AUTORECONF = YES
LIBWEBSOCKETS_INSTALL_STAGING = YES

$(eval $(autotools-package))
