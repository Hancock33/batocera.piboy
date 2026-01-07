################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Jan 06, 2026
DHEWM3_VERSION = 0ecf60c92cf7c65f2dd27e6653baf74d4e3f2652
DHEWM3_SITE = $(call github,dhewm,dhewm3,$(DHEWM3_VERSION))
DHEWM3_LICENSE = GPL-3.0
DHEWM3_LICENSE_FILES = COPYING.txt
DHEWM3_SUPPORTS_IN_SOURCE_BUILD = NO
DHEWM3_SUBDIR = neo
DHEWM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DHEWM3_CONF_OPTS += -DSDL2=ON

$(eval $(cmake-package))
