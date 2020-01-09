################################################################################
#
# kodi-pvr-pctv
#
################################################################################

KODI18_PVR_PCTV_VERSION = 2.4.5-Leia
KODI18_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI18_PVR_PCTV_VERSION))
KODI18_PVR_PCTV_LICENSE = GPL-2.0+
KODI18_PVR_PCTV_LICENSE_FILES = src/client.h
KODI18_PVR_PCTV_DEPENDENCIES = jsoncpp kodi18-platform

$(eval $(cmake-package))
