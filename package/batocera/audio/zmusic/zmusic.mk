################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Sept 23, 2025
ZMUSIC_VERSION = 4b443225eae919c31dc99e47c4ef217a75bb1927
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
