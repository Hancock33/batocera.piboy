################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Jan 31, 2026
DHEWM3_VERSION = a93e50f95796c93dab7b8d8a8daf495ef767afa3
DHEWM3_SITE = $(call github,dhewm,dhewm3,$(DHEWM3_VERSION))
DHEWM3_LICENSE = GPL-3.0
DHEWM3_LICENSE_FILES = COPYING.txt
DHEWM3_SUPPORTS_IN_SOURCE_BUILD = NO
DHEWM3_SUBDIR = neo
DHEWM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DHEWM3_CONF_OPTS += -DSDL2=ON

DHEWM3_EMULATOR_INFO = doom3.emulator.yml

$(eval $(cmake-package))
$(eval $(emulator-info-package))
