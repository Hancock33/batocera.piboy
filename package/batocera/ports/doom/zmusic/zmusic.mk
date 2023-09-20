################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Sept 17, 2023
ZMUSIC_VERSION = 3e1deba3a23bd290b7bd40955885544ce5504f9e
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib

$(eval $(cmake-package))
$(eval $(host-cmake-package))
