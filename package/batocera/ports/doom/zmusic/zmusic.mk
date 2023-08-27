################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Aug 27, 2023
ZMUSIC_VERSION = 576b7da64dc8501f83fc8a15115e8c471de90d3c
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib

$(eval $(cmake-package))
$(eval $(host-cmake-package))
