################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 18, 2023
FHEROES2_VERSION = 4b165c084000cb88514e8e36030d5947e43c4499
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
