################################################################################
#
# GZDOOM Music
#
################################################################################
# Version: Commits on Apr 12, 2022
ZMUSIC_VERSION = ad00418fec24f40fa961f43067c9afc5268f35c1
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))

ZMUSIC_DEPENDENCIES = sdl2 sdl2_mixer host-gzdoom host-lzdoom
ZMUSIC_LICENSE = GPL-2.0
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))

