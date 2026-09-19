################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Sept 18, 2026
ZMUSIC_VERSION = dac711d23db9b3a69ceaabbf4ba34a5c6a651cd8
ZMUSIC_SITE = $(call github,UZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
