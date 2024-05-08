################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 08, 2024
FHEROES2_VERSION = 96aae0b282c10de28498b34456056c02ab0657b5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
