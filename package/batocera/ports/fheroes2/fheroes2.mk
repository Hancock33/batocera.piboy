################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 25, 2024
FHEROES2_VERSION = 2f937ba6c921b5c4494e957ce103e14992704ebe
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
