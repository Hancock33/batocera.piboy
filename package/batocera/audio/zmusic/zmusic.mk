################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Apr 28, 2024
ZMUSIC_VERSION = 50ad730c381ce01a01a693e9e1d43e80c34eaeed
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib
HOST_ZMUSIC_DEPENDENCIES = host-libglib2

$(eval $(cmake-package))
$(eval $(host-cmake-package))
