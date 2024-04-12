################################################################################
#
# openjazz
#
################################################################################
# Version: Commits on Apr 12, 2024
OPENJAZZ_VERSION = 6dbb933152c7c715f0fb89f719f7918387c8640a
OPENJAZZ_SITE =  $(call github,AlisterT,openjazz,$(OPENJAZZ_VERSION))

OPENJAZZ_DEPENDENCIES = sdl2 sdl2_net
OPENJAZZ_LICENSE = GPLv2

OPENJAZZ_CONF_OPTS += -DDATAPATH=/userdata/roms/ports/openjazz
OPENJAZZ_CONF_OPTS += -DNETWORK=ON

define OPENJAZZ_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/OpenJazz $(TARGET_DIR)/usr/bin/OpenJazz
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjazz/openjazz.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
