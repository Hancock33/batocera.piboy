################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 22, 2024
FHEROES2_VERSION = da71bd697616b4c84d0e76b7df3500abd8a8b960
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
