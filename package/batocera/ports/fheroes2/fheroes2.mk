################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 12, 2024
FHEROES2_VERSION = 4b684a0be0efe21cafb3c814fd80b497ace88da9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
