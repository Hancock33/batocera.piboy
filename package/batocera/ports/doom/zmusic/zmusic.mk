################################################################################
#
# GZDOOM Music
#
################################################################################
# Version: Commits on Jun 06, 2022
ZMUSIC_VERSION = 9fbc2ec095ec14267d00caba75cc3e7f59976697
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))

ZMUSIC_DEPENDENCIES = sdl2 sdl2_mixer host-gzdoom host-lzdoom
ZMUSIC_LICENSE = GPL-2.0
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))

