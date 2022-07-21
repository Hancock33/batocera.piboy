################################################################################
#
# GZDOOM Music
#
################################################################################
# Version: Commits on Jul 21, 2022
ZMUSIC_VERSION = 6da5525ba813395a3a53c13a2b2e4ae8ac63db56
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))

ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib host-gzdoom host-lzdoom
ZMUSIC_LICENSE = GPL-2.0
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))

