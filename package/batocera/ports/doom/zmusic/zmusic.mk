################################################################################
#
# GZDOOM Music
#
################################################################################
# Version: Commits on Apr 08, 2022
ZMUSIC_VERSION = a3b79ca8f6fcf65cf5a913245014c5752c569688
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))

ZMUSIC_DEPENDENCIES = sdl2 sdl2_mixer host-gzdoom host-lzdoom
ZMUSIC_LICENSE = GPL-2.0
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))

