################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Oct 10, 2024
ZMUSIC_VERSION = 519b76b6e7a89752757732561ff2cada3cd7d221
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
