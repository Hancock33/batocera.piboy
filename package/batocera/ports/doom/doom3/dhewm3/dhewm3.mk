################################################################################
#
# dhewm3
#
################################################################################
# Version: Commits on Dec 29, 2025
DHEWM3_VERSION = f2943c96ced8e139f6e43f2c586fcc4b5ef9f532
DHEWM3_SITE = $(call github,dhewm,dhewm3,$(DHEWM3_VERSION))
DHEWM3_LICENSE = GPL-3.0
DHEWM3_LICENSE_FILES = COPYING.txt
DHEWM3_SUPPORTS_IN_SOURCE_BUILD = NO
DHEWM3_SUBDIR = neo
DHEWM3_DEPENDENCIES = host-libjpeg libcurl libogg libvorbis openal sdl2 zlib

DHEWM3_CONF_OPTS += -DSDL2=ON

$(eval $(cmake-package))
