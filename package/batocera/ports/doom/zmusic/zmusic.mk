################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Nov 05, 2022
ZMUSIC_VERSION = 7a7ee92ff801d9874383476ef7843dfb89f3c934
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib host-gzdoom

ZMUSIC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
$(eval $(host-cmake-package))
