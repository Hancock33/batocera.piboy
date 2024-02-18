################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 18, 2024
FHEROES2_VERSION = 8b62e28179034e40ae96222a1b89ab6ad3e30cbd
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
