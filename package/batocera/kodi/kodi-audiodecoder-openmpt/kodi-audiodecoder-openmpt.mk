################################################################################
#
# kodi-audiodecoder-openmpt
#
################################################################################
# Version: Commits on Aug 13, 2025
KODI_AUDIODECODER_OPENMPT_VERSION = 22.0.1-Piers
KODI_AUDIODECODER_OPENMPT_BRANCH = Piers
KODI_AUDIODECODER_OPENMPT_SITE = $(call github,xbmc,audiodecoder.openmpt,$(KODI_AUDIODECODER_OPENMPT_VERSION))
KODI_AUDIODECODER_OPENMPT_LICENSE = GPL-2.0+
KODI_AUDIODECODER_OPENMPT_LICENSE_FILES = LICENSE.md
KODI_AUDIODECODER_OPENMPT_DEPENDENCIES = kodi zlib libopenmpt

$(eval $(cmake-package))
