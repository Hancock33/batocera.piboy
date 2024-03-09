################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Mar 09, 2024
FHEROES2_VERSION = 612eb12abd27c2fee161c93a259a8e00c514c678
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
