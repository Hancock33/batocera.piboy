################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Jan 10, 2025
ZMUSIC_VERSION = 4cc05f758441ca44e384a2a8afb68d10ce92c82b
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
