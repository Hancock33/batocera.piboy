################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 29, 2024
FHEROES2_VERSION = 8738bc6e35cd18510243fba99fc204f7e232921f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
