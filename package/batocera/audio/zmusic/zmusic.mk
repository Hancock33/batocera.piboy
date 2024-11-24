################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Nov 23, 2024
ZMUSIC_VERSION = 628cd492219fc749bdc69d99fa5c3cd7acd47ac6
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
