################################################################################
#
# Fallout 2
#
################################################################################
# Version: Commits on Jul 23, 2022
FALLOUT2_VERSION = 757330bff425a9918cafa57dd02d2d2746072a33
FALLOUT2_SITE = $(call github,alexbatalov,fallout2-ce,$(FALLOUT2_VERSION))

FALLOUT2_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf
FALLOUT2_LICENSE = GPL-3.0
FALLOUT2_SUPPORTS_IN_SOURCE_BUILD = NO

FALLOUT2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
