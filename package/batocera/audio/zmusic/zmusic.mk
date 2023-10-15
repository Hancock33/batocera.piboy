################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Sept 24, 2023
ZMUSIC_VERSION = 26c889088d45fb46741db9bde544578443671af1
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib

$(eval $(cmake-package))
$(eval $(host-cmake-package))
