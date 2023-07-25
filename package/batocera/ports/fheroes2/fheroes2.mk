################################################################################
#
# Free Heroes (of Might and Magic) 2 engine
#
################################################################################
# Version: Commits on Jul 25, 2023
FHEROES2_VERSION = 6daee3b623ef102e4b52f515986167eebf81c4aa
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
