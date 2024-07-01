################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 01, 2024
FHEROES2_VERSION = 816491b94d6592d3e0d8dbbda4145dba6eacc55d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
