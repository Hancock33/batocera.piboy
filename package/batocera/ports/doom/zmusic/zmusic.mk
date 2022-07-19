################################################################################
#
# GZDOOM Music
#
################################################################################
# Version: Commits on Jul 18, 2022
ZMUSIC_VERSION = c5b6c0d317beef4a8cd5af1437fd6261391118ca
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))

ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib host-gzdoom host-lzdoom
ZMUSIC_LICENSE = GPL-2.0
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))

