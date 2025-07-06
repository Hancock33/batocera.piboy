################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Jul 05, 2025
ZMUSIC_VERSION = a70ec38e4b83b15d6f2ae8a01521bf80ae51a7d1
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
