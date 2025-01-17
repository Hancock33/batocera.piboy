################################################################################
#
# kodi-audiodecoder-openmpt
#
################################################################################
# Version: Commits on Jan 17, 2025
KODI_AUDIODECODER_OPENMPT_VERSION = e6d0e9a354ba33b32c76392ab6ab24223e968467
KODI_AUDIODECODER_OPENMPT_BRANCH = Omega
KODI_AUDIODECODER_OPENMPT_SITE = $(call github,xbmc,audiodecoder.openmpt,$(KODI_AUDIODECODER_OPENMPT_VERSION))
KODI_AUDIODECODER_OPENMPT_LICENSE = GPL-2.0+
KODI_AUDIODECODER_OPENMPT_LICENSE_FILES = LICENSE.md
KODI_AUDIODECODER_OPENMPT_DEPENDENCIES = kodi zlib libopenmpt

$(eval $(cmake-package))
