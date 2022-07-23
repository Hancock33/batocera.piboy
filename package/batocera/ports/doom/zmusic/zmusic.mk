################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Jul 21, 2022
ZMUSIC_VERSION = 6da5525ba813395a3a53c13a2b2e4ae8ac63db56
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib host-gzdoom

ZMUSIC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
$(eval $(host-cmake-package))
