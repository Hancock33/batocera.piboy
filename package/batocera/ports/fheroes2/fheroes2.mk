################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 08, 2024
FHEROES2_VERSION = da92b84e5ff346e801a965f6a3ebbaea8214f34d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
