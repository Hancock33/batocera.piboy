################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 08, 2023
FHEROES2_VERSION = 3a536571d2f42d1873ddfbec3ab91ab34820bd4f
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
