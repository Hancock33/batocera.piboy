################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Feb 23, 2026
ZMUSIC_VERSION = 18040ccfe4b8d0a60bd761b542c5af0057211707
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
