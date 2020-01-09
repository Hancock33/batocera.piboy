################################################################################
#
# kodi-pvr-vdr-vnsi
#
################################################################################

KODI18_PVR_VDR_VNSI_VERSION = 3.6.3-Leia
KODI18_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI18_PVR_VDR_VNSI_VERSION))
KODI18_PVR_VDR_VNSI_LICENSE = GPL-2.0+
KODI18_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
KODI18_PVR_VDR_VNSI_DEPENDENCIES = kodi18-platform

$(eval $(cmake-package))
