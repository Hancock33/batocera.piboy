################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 15, 2023
FHEROES2_VERSION = 4145a7f4dfaee3a5dd904ce3973a637d678571dd
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
