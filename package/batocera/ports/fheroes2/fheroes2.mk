################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 12, 2024
FHEROES2_VERSION = 0966a10fefc44695214b83029cc3c7d683224c9b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
