################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 24, 2024
FHEROES2_VERSION = 3374d0988d397936ad0cdee9814124a4b3188eaf
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
