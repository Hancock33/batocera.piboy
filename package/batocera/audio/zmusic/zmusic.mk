################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Nov 02, 2025
ZMUSIC_VERSION = 0fb7f1877c8ac987375e1bbaab7868e4669a1940
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
