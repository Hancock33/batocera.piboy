################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 04, 2024
FHEROES2_VERSION = d6c05ea6f435c8239d5e137b27182961f7f4c805
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
