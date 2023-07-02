################################################################################
#
# kodi-platform
#
################################################################################

KODI_KODI_PLATFORM_VERSION = 809c5e9d711e378561440a896fcb7dbcd009eb3d
KODI_KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
KODI_KODI_PLATFORM_LICENSE = GPL-2.0+
KODI_KODI_PLATFORM_LICENSE_FILES = LICENSE.md
KODI_KODI_PLATFORM_DEPENDENCIES = kodi

$(eval $(cmake-package))
