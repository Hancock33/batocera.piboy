################################################################################
#
# kodi-audiodecoder-timidity
#
################################################################################

KODI18_AUDIODECODER_TIMIDITY_VERSION = 2.0.3-Leia
KODI18_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI18_AUDIODECODER_TIMIDITY_VERSION))
KODI18_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
KODI18_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
KODI18_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi18

$(eval $(cmake-package))
