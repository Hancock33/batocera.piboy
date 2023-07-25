################################################################################
#
# kodi-pvr-freebox
#
################################################################################

KODI_PVR_FREEBOX_VERSION = 20.3.2-Nexus
KODI_PVR_FREEBOX_SITE = $(call github,aassif,pvr.freebox,$(KODI_PVR_FREEBOX_VERSION))
KODI_PVR_FREEBOX_LICENSE = MIT
KODI_PVR_FREEBOX_DEPENDENCIES = kodi

$(eval $(cmake-package))
