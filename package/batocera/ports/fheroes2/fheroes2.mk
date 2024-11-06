################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 06, 2024
FHEROES2_VERSION = bb4f3262883d024574f26039c1ca80ccdf50dc11
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
