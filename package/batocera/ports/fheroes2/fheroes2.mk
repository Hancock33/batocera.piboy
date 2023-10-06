################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 06, 2023
FHEROES2_VERSION = 5319cbabe203021371ec2f0a0a739b16304ed7a4
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
