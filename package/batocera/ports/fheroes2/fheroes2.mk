################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Nov 02, 2024
FHEROES2_VERSION = 722315f30b147f6889d603de70d0c305de21c247
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
