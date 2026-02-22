################################################################################
#
# openjazz
#
################################################################################
# Version: Commits on Feb 22, 2026
OPENJAZZ_VERSION = d6ad5e3438a597d40ae658d60406b6e844a3a3df
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
