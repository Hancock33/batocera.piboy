################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Oct 04, 2025
ZMUSIC_VERSION = dd4f39a61b076c6ca3ceb41e72350c85a2aade1d
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
