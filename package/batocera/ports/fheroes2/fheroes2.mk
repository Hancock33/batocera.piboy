################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 31, 2024
FHEROES2_VERSION = 21f7eb0a88d6052fc2c1a17940e40691259fcafb
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
