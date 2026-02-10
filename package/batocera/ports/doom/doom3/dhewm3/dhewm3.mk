################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Feb 05, 2026
DHEWM3_VERSION = 4e1aa367743878109bc4e501962ae04ab4ca6e6c
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
