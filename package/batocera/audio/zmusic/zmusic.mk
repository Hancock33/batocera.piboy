################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Oct 09, 2024
ZMUSIC_VERSION = 89f3d65734470fb7ec0c1e69f73a0cfcc88ed557
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
