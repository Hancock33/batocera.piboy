################################################################################
#
# sdl3
#
################################################################################
# Version: Commits on Aug 04, 2025
SDL3_VERSION = release-3.2.20
SDL3_SITE = $(call github,libsdl-org,SDL,$(SDL3_VERSION))
SDL3_LICENSE = GPL-3.0
SDL3_SUPPORTS_IN_SOURCE_BUILD = NO
SDL3_INSTALL_STAGING = YES

$(eval $(cmake-package))
