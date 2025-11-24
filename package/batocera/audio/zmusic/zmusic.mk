################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Nov 23, 2025
ZMUSIC_VERSION = 387f676104f7a5721a3589b5e6a8130a1a964e25
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
