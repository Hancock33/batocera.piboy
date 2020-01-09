################################################################################
#
# kodi-audiodecoder-snesapu
#
################################################################################

KODI18_AUDIODECODER_SNESAPU_VERSION = 2.0.1-Leia
KODI18_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI18_AUDIODECODER_SNESAPU_VERSION))
KODI18_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
KODI18_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
KODI18_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi18

$(eval $(cmake-package))
