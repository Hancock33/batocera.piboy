################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Jun 17, 2025
ZMUSIC_VERSION = 323d29ef5f9002be477d1f182b0a057d61e023a8
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
