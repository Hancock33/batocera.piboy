################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 10, 2023
FHEROES2_VERSION = 5972f4bb33e9cb557355945e649094c3aa6a2a9f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
