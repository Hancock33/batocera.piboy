################################################################################
#
# kodi-pvr-freebox
#
################################################################################
# Version: Commits on Feb 13, 2023
KODI_PVR_FREEBOX_VERSION = 21.0.0-Omega
KODI_PVR_FREEBOX_BRANCH = Omega
KODI_PVR_FREEBOX_SITE = $(call github,aassif,pvr.freebox,$(KODI_PVR_FREEBOX_VERSION))
KODI_PVR_FREEBOX_LICENSE = MIT
KODI_PVR_FREEBOX_DEPENDENCIES = kodi

$(eval $(cmake-package))
