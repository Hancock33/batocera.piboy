################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 08, 2023
FHEROES2_VERSION = bb622f7b62d03d8971a6a3bd5ce6b01a7f91fe50
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
