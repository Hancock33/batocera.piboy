################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Apr 28, 2024
ZMUSIC_VERSION = 1.1.13
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib
HOST_ZMUSIC_DEPENDENCIES = host-libglib2

$(eval $(cmake-package))
$(eval $(host-cmake-package))
