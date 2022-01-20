################################################################################
#
# TEKWAR
#
################################################################################
# Version.: Commits on Jan 26, 2021
TEKWAR_VERSION = fd88dd7ea2a9f66baf14fffad5bed17220833b2b
TEKWAR_SITE = https://github.com/jonof/jftekwar.git

TEKWAR_DEPENDENCIES = sdl2 sdl2_image
TEKWAR_SITE_METHOD=git
TEKWAR_GIT_SUBMODULES=YES
TEKWAR_LICENSE = GPLv3

TEKWAR_CONF_OPTS +=RELEASE=1
TEKWAR_CONF_OPTS +=WITHOUT_GTK=1
TEKWAR_CONF_OPTS +=DATADIR=/userdata/roms/etekwar

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
TEKWAR_CONF_OPTS=USE_OPENGL=1 POLYMER=1
else
TEKWAR_CONF_OPTS=USE_OPENGL=0 POLYMER=1
endif

define TEKWAR_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f Makefile $(TEKWAR_CONF_OPTS)
endef

define TEKWAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/tekwar -D $(TARGET_DIR)/usr/bin/etekwar
	# make rom path
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/etekwar
	cp $(@D)/data/*.dat $(TARGET_DIR)/usr/share/batocera/datainit/roms/etekwar/
	
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/tekwar/tekwar.keys $(TARGET_DIR)/usr/share/evmapy/etekwar.keys
endef

$(eval $(generic-package))
