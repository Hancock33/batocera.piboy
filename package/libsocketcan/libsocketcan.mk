################################################################################
#
# libsocketcan
#
################################################################################
LIBSOCKETCAN_VERSION = 0.0.9
LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download/
LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2

$(eval $(autotools-package))
