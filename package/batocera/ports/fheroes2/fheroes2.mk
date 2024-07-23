################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 23, 2024
FHEROES2_VERSION = 16ce7a4fd3a06c464cf26e15a0aaf9d087802098
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
