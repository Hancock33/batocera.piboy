################################################################################
#
# Free Heroes (of Might and Magic) 2 engine
#
################################################################################
# Version: Commits on Jul 29, 2023
FHEROES2_VERSION = 736c944c6b410dbab43e1b33495cef8be4f9ae48
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
