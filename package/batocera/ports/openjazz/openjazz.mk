################################################################################
#
# openjazz
#
################################################################################
# Version: Commits on May 20, 2026
OPENJAZZ_VERSION = 0100d5eeb171a243d374d3780a6da8dbc4aa8f4c
OPENJAZZ_SITE =  $(call github,AlisterT,openjazz,$(OPENJAZZ_VERSION))
OPENJAZZ_DEPENDENCIES = sdl2
OPENJAZZ_LICENSE = GPLv2
OPENJAZZ_EMULATOR_INFO = openjazz.emulator.yml

OPENJAZZ_CONF_OPTS += -DDATAPATH=/userdata/roms/ports/openjazz
OPENJAZZ_CONF_OPTS += -DFULLSCREEN_ONLY=ON
OPENJAZZ_CONF_OPTS += -DNETWORK=ON

define OPENJAZZ_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/OpenJazz $(TARGET_DIR)/usr/bin/OpenJazz
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
