################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Oct 05, 2024
ZMUSIC_VERSION = 6c5cf572aa5447e08a27b87e96a955c27098f542
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
