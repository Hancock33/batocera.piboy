################################################################################
#
# dungeonrush
#
################################################################################
# Version: Commits on Jan 05, 2022
DUNGEONRUSH_VERSION = ff44828b2bd89e0edb831673aca64ef4377c0c32
DUNGEONRUSH_SITE = $(call github,rapiz1,DungeonRush,$(DUNGEONRUSH_VERSION))

DUNGEONRUSH_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
DUNGEONRUSH_LICENSE = GPL-3.0
DUNGEONRUSH_SUPPORTS_IN_SOURCE_BUILD = NO

DUNGEONRUSH_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DDUNGEONRUSH_ASSET_INSTALL=OFF

$(eval $(cmake-package))
