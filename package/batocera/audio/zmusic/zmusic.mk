################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Nov 23, 2025
ZMUSIC_VERSION = b151968eb0279b2949d596813d2bd5bcbeb5bea3
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
