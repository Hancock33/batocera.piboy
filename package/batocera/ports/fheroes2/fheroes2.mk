################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 07, 2023
FHEROES2_VERSION = ef3f5fcbe933f905b36b8dd7e0c4ed70f9672aa5
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
