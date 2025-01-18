################################################################################
#
# kodi-audiodecoder-openmpt
#
################################################################################
# Version: Commits on Jan 18, 2025
KODI_AUDIODECODER_OPENMPT_VERSION = 67df2ab898eef887d3471bb563d7b66eccefed9b
KODI_AUDIODECODER_OPENMPT_BRANCH = Omega
KODI_AUDIODECODER_OPENMPT_SITE = $(call github,xbmc,audiodecoder.openmpt,$(KODI_AUDIODECODER_OPENMPT_VERSION))
KODI_AUDIODECODER_OPENMPT_LICENSE = GPL-2.0+
KODI_AUDIODECODER_OPENMPT_LICENSE_FILES = LICENSE.md
KODI_AUDIODECODER_OPENMPT_DEPENDENCIES = kodi zlib libopenmpt

$(eval $(cmake-package))
