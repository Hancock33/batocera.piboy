################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 26, 2024
FHEROES2_VERSION = 010ac0ff5859ed56ab75f728be9353c89d4eb34c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
