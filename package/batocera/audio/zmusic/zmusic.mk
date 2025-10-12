################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Oct 06, 2025
ZMUSIC_VERSION = 44f1eec9cb7dede2c2dd61647f022e7631572251
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
