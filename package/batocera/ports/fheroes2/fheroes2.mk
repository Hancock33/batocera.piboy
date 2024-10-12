################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 12, 2024
FHEROES2_VERSION = 8e9bb78f568db0da1a50822b996cb0a07c363605
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
