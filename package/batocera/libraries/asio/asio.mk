################################################################################
#
# asio
#
################################################################################
# Version: Commits on Jul 18, 2026
ASIO_VERSION = 8806a6803cde7054c3049d3666d3ec36786568c5
ASIO_SITE = $(call github,chriskohlhoff,asio,$(ASIO_VERSION))
ASIO_LICENSE = GPL-3.0+
ASIO_LICENSE_FILES = COPYING
ASIO_DEPENDENCIES = ncurses
ASIO_AUTORECONF = YES
ASIO_INSTALL_STAGING = YES

$(eval $(autotools-package))
