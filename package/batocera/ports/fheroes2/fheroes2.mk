################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 08, 2024
FHEROES2_VERSION = bc25cda25e6f7551bed10571caf45bdce667dd49
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
