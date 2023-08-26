################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 26, 2023
FHEROES2_VERSION = 0df4b4640fce7f25d93ebb3cae1126b6eb77f0f8
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
