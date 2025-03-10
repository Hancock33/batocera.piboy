################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Mar 08, 2025
ZMUSIC_VERSION = 6928b8609db9b1c104c4cd4f9b163486121fb0f0
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
