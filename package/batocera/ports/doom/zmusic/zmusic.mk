################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Aug 14, 2022
ZMUSIC_VERSION = 47255178329bab4efa4408a4e4d373fb9264e8c5
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib host-gzdoom

ZMUSIC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
$(eval $(host-cmake-package))
