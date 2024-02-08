################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 08, 2024
FHEROES2_VERSION = ec55a4cf5369ef6e306c779e81cc81ab1f30b670
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
