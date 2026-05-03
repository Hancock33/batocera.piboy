################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Apr 30, 2026
ZMUSIC_VERSION = d3b730795784bff3f97571446101c57c1c6ac9bc
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
