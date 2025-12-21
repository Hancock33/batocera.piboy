################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Dec 21, 2025
ZMUSIC_VERSION = 131d4575eae9ef1e22b32d25d5f771c2995a31af
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
