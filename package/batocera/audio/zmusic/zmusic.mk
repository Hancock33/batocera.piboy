################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Jul 23, 2025
ZMUSIC_VERSION = ac3e232b001129c740b7b65196ae0e1b13b82513
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = alsa-lib fluidsynth libglib2 libsndfile mpg123 zlib

$(eval $(cmake-package))
