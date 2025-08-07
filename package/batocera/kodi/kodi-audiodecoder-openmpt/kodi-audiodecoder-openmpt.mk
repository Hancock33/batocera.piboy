################################################################################
#
# kodi-audiodecoder-openmpt
#
################################################################################
# Version: Commits on Jul 28, 2025
KODI_AUDIODECODER_OPENMPT_VERSION = 1879e08bdcc37907e846b682498188eec64ed49b
KODI_AUDIODECODER_OPENMPT_BRANCH = Piers
KODI_AUDIODECODER_OPENMPT_SITE = $(call github,xbmc,audiodecoder.openmpt,$(KODI_AUDIODECODER_OPENMPT_VERSION))
KODI_AUDIODECODER_OPENMPT_LICENSE = GPL-2.0+
KODI_AUDIODECODER_OPENMPT_LICENSE_FILES = LICENSE.md
KODI_AUDIODECODER_OPENMPT_DEPENDENCIES = kodi zlib libopenmpt

$(eval $(cmake-package))
