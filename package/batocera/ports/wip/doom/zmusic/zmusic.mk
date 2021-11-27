################################################################################
#
# GZDOOM Music
#
################################################################################
# Version.: Commits on Nov 06, 2021
ZMUSIC_VERSION = 5ac16461ad4d9b83150fbad74ff6d7f903092550
ZMUSIC_SITE = $(call github,coelckers,ZMusic,$(ZMUSIC_VERSION))

ZMUSIC_DEPENDENCIES = sdl2 sdl2_mixer host-gzdoom
ZMUSIC_LICENSE = GPL-2.0
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))

