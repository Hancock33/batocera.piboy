################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 02, 2023
FHEROES2_VERSION = 280e9be0da54c0ed98626bf079f0efd00793dc04
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
