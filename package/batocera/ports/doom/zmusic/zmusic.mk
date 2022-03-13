################################################################################
#
# GZDOOM Music
#
################################################################################
# Version.: Commits on Dec 29, 2021
ZMUSIC_VERSION = 6b5aebf6a33d83912de16ed5a7999946bd7b6988
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))

ZMUSIC_DEPENDENCIES = sdl2 sdl2_mixer host-gzdoom host-lzdoom
ZMUSIC_LICENSE = GPL-2.0
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))

