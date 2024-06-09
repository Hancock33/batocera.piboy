################################################################################
#
# kodi-audiodecoder-openmpt
#
################################################################################
# Version: Commits on Feb 19, 2024
KODI_AUDIODECODER_OPENMPT_VERSION = f7cb103de96404fe26938f93cd277a066f77cb49
KODI_AUDIODECODER_OPENMPT_BRANCH = Omega
KODI_AUDIODECODER_OPENMPT_SITE = $(call github,xbmc,audiodecoder.openmpt,$(KODI_AUDIODECODER_OPENMPT_VERSION))
KODI_AUDIODECODER_OPENMPT_LICENSE = GPL-2.0+
KODI_AUDIODECODER_OPENMPT_LICENSE_FILES = LICENSE.md
KODI_AUDIODECODER_OPENMPT_DEPENDENCIES = kodi zlib libopenmpt

$(eval $(cmake-package))
