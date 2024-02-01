################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 01, 2024
FHEROES2_VERSION = 985a691058ebd658c6031b633dbe5e03a3bfe9b7
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
