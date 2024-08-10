################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 10, 2024
FHEROES2_VERSION = 48d68c10d89c7eedb34e897d12bd8968d412be08
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
