################################################################################
#
# Quake 1
#
################################################################################
# Version: Commits on Mar Apr 01, 2022
QUAKESPASM_VERSION = ae97a7b5ed9b179d84586d59b136544e1919910d
QUAKESPASM_SITE = https://git.code.sf.net/p/quakespasm/quakespasm

QUAKESPASM_DEPENDENCIES = sdl2 sdl2_image
QUAKESPASM_SITE_METHOD=git
QUAKESPASM_LICENSE = GPLv2

define QUAKESPASM_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)/Quake -f Makefile USE_SDL2=1 DO_USERDIRS=1
endef

define QUAKESPASM_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/Quake/quakespasm $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/tyrquake/id1
	cp -pvr $(@D)/Quake/quakespasm.pak $(TARGET_DIR)/usr/share/batocera/datainit/roms/tyrquake/id1
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.quakespasm/{id1,dopa,hipnotic,rogue}
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quakespasm/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.quakespasm/id1
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quakespasm/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.quakespasm/dop
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quakespasm/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.quakespasm/hipnotic
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quakespasm/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.quakespasm/rogue
    # evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quakespasm/quakespasm.keys $(TARGET_DIR)/usr/share/evmapy/tyrquake.quakespasm.keys
endef

$(eval $(generic-package))
