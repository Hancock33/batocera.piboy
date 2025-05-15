################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on May 15, 2025
ZMUSIC_VERSION = 849984a5e38e6ae2a0eb99f17b05157dc6e7242d
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
