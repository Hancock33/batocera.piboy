################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Aug 27, 2026
ZMUSIC_VERSION = 4d9680d4f05d91c1c9fe1e6a4606eb81bd579563
ZMUSIC_SITE = $(call github,UZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
