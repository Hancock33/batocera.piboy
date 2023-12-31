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
ZMUSIC_DEPENDENCIES = alsa-lib libglib2 libsndfile  mpg123 zlib
HOST_ZMUSIC_DEPENDENCIES = host-libglib2

$(eval $(cmake-package))
$(eval $(host-cmake-package))
