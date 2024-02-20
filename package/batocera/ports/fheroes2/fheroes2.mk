################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 20, 2024
FHEROES2_VERSION = 7c5efe9ccdba033318d7d717ec0dfa310882bdcb
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
