################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Apr 03, 2024
ZMUSIC_VERSION = b31b43efd0e92c8bff5501e95b31d9439642b711
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib
HOST_ZMUSIC_DEPENDENCIES = host-libglib2

$(eval $(cmake-package))
$(eval $(host-cmake-package))
