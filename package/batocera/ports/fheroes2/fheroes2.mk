################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 19, 2024
FHEROES2_VERSION = 7b1422bac71845d6140ecce3f765d5b337bb8960
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
