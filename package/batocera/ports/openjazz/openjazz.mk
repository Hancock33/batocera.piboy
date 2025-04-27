################################################################################
#
# openjazz
#
################################################################################
# Version: Commits on Apr 27, 2025
OPENJAZZ_VERSION = b8c292264f9695d4ac0d8be7590a4a8cc6f2a59c
OPENJAZZ_SITE =  $(call github,AlisterT,openjazz,$(OPENJAZZ_VERSION))
OPENJAZZ_DEPENDENCIES = sdl2
OPENJAZZ_LICENSE = GPLv2

OPENJAZZ_CONF_OPTS += -DDATAPATH=/userdata/roms/ports/openjazz
OPENJAZZ_CONF_OPTS += -DFULLSCREEN_ONLY=ON
OPENJAZZ_CONF_OPTS += -DNETWORK=ON

define OPENJAZZ_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/OpenJazz $(TARGET_DIR)/usr/bin/OpenJazz
endef

$(eval $(cmake-package))
