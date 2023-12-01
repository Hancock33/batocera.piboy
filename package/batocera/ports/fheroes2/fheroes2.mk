################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 01, 2023
FHEROES2_VERSION = a2982ba216bdf82def082682035ef2606ffccc96
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
