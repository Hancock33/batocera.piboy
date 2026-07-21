################################################################################
#
# trx
#
################################################################################
# Version: Commits on Jul 19, 2026
TRX_VERSION = trx-1.9.3
TRX_SITE = $(call github,LostArtefacts,TRX,$(TRX_VERSION))
TRX_LICENSE = GPL-3.0 license
TRX_LICENSE_FILES = COPYING.md
TRX_SUPPORTS_IN_SOURCE_BUILD = NO
TRX_SUBDIR = src
TRX_EMULATOR_INFO = trx.emulator.yml
TRX_DEPENDENCIES = ffmpeg libglew pcre2 sdl2 uthash

TRX_CONF_OPTS = -Dstaticdeps=false

$(eval $(meson-package))
$(eval $(emulator-info-package))
