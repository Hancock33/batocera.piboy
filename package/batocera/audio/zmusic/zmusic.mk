################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Jul 05, 2025
ZMUSIC_VERSION = ceb92b5fcea76b62f4f04c17f687d882c95b61b3
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
