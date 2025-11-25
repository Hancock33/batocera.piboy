################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Nov 24, 2025
ZMUSIC_VERSION = 59101ab757be25cd658c9dc7656f7c736dbf1014
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
