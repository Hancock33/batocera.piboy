################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Mar 20, 2026
ZMUSIC_VERSION = 09c3cbea05fbc3a70cdd39857b83bddd8948eabb
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
