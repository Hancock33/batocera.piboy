################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Nov 29, 2023
ZMUSIC_VERSION = 5ce525efc75a97d1391b46cca4def41a13ff1619
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib

$(eval $(cmake-package))
$(eval $(host-cmake-package))
