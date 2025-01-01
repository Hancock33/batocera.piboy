################################################################################
#
# dentonmod
#
################################################################################
# Version: Commits on Apr 19, 2024
DENTONMOD_VERSION = 72d2c417645d47a382b061d2a6db4a46e060145d
DENTONMOD_SITE = $(call github,dhewm,dhewm3-sdk,$(DENTONMOD_VERSION))
DENTONMOD_LICENSE = GPLv3
DENTONMOD_LICENSE_FILES = COPYING.txt

DENTONMOD_DEPENDENCIES = dhewm3 host-libjpeg libcurl libogg libvorbis openal sdl2 zlib 

DENTONMOD_CONF_OPTS = -DBASE_NAME=dentonmod

define DENTONMOD_INSTALL_TARGET_CMDS 
    mkdir -p $(TARGET_DIR)/usr/lib/dhewm3
	cp $(@D)/dentonmod*.so $(TARGET_DIR)/usr/lib/dhewm3/
endef

$(eval $(cmake-package))
