################################################################################
#
# asio
#
################################################################################
# Version: Commits on Jul 18, 2026
ASIO_VERSION = asio-1-38-2
ASIO_SITE = $(call github,chriskohlhoff,asio,$(ASIO_VERSION))
ASIO_LICENSE = BSL-1.0
ASIO_LICENSE_FILES = LICENSE_1_0.txt
ASIO_AUTORECONF = YES
ASIO_INSTALL_STAGING = YES
ASIO_INSTALL_TARGET = NO

$(eval $(autotools-package))
