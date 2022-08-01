################################################################################
#
# zmusic
#
################################################################################
# Version: Commits Jul 31, 2022
ZMUSIC_VERSION = 8ebcd430b2865163ab5dadf34a6e0b27f0a68585
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib host-gzdoom

ZMUSIC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
$(eval $(host-cmake-package))
