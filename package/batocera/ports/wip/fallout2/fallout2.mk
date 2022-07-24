################################################################################
#
# fallout2
#
################################################################################
# Version: Commits on Jul 24, 2022
FALLOUT2_VERSION = a60382e044977c026415f006c5e0dc7c9f2c85f2
FALLOUT2_SITE = $(call github,alexbatalov,fallout2-ce,$(FALLOUT2_VERSION))

FALLOUT2_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
FALLOUT2_LICENSE = GPL-3.0
FALLOUT2_SUPPORTS_IN_SOURCE_BUILD = NO

FALLOUT2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
