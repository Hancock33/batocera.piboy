################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Oct 13, 2024
ZMUSIC_VERSION = 3944bbc7568a6e945c7ae8c7f7e126731db62b83
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
