################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 01, 2024
FHEROES2_VERSION = 55068ef8e99a8b108e6a145ad75f7f5369e2dd52
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
