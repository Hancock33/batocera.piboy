################################################################################
#
# kodi-pvr-freebox
#
################################################################################
# Version: Commits on Oct 14, 2026
KODI_PVR_FREEBOX_VERSION = 22.2.2-Piers
KODI_PVR_FREEBOX_BRANCH = Piers
KODI_PVR_FREEBOX_SITE = $(call github,aassif,pvr.freebox,$(KODI_PVR_FREEBOX_VERSION))
KODI_PVR_FREEBOX_LICENSE = MIT
KODI_PVR_FREEBOX_DEPENDENCIES = kodi json-for-modern-cpp

$(eval $(cmake-package))
