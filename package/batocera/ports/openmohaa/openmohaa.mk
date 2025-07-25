################################################################################
# This file is part of the batocera distribution (https://batocera.org).
# Copyright (c) 2025+.
#
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# YOU MUST KEEP THIS HEADER AS IT IS
################################################################################
#
# openmohaa
#
################################################################################
# Version: Commits on Jul 20, 2025
OPENMOHAA_VERSION = 95a7169d211dbd695128acb51b8c997699acda75
OPENMOHAA_SITE = $(call github,openmoh,openmohaa,$(OPENMOHAA_VERSION))
OPENMOHAA_SUPPORTS_IN_SOURCE_BUILD = NO
OPENMOHAA_LICENSE = GPL-2.0 license
OPENMOHAA_LICENSE_FILE = COPYING.txt

OPENMOHAA_DEPENDENCIES += libcurl openal sdl2

OPENMOHAA_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
OPENMOHAA_CONF_OPTS += -DTARGET_LOCAL_SYSTEM=ON

# We just want the client
define OPENMOHAA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/openmohaa
	cp $(@D)/buildroot-build/openmohaa $(TARGET_DIR)/usr/bin/openmohaa/
	cp $(@D)/buildroot-build/code/client/cgame/cgame.so $(TARGET_DIR)/usr/bin/openmohaa/
	cp $(@D)/buildroot-build/code/server/fgame/game.so  $(TARGET_DIR)/usr/bin/openmohaa/
endef

define OPENMOHAA_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openmohaa/mohaa.keys $(TARGET_DIR)/usr/share/evmapy
endef

OPENMOHAA_POST_INSTALL_TARGET_HOOKS += OPENMOHAA_EVMAPY

$(eval $(cmake-package))
