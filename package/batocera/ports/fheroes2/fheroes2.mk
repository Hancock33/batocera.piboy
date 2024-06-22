################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 21, 2024
FHEROES2_VERSION = fc637369118f7b695bb6c0d73552d28be6841d67
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
