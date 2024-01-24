################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 24, 2024
FHEROES2_VERSION = c90d267cc99f21bd4799f8af2e64fbc8663b1a17
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
