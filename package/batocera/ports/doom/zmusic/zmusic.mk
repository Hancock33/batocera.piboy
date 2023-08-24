################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Aug 23, 2023
ZMUSIC_VERSION = e970fb15f0799d12e232fdf7be4091bac5ea21e1
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib

$(eval $(cmake-package))
$(eval $(host-cmake-package))
