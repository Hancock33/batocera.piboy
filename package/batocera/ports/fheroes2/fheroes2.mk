################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 27, 2023
FHEROES2_VERSION = 0ae326af7978c2fa101ed89dba2e4bdc82b586f3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
