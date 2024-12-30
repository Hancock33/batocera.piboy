################################################################################
#
# prototype
#
################################################################################
# Version: Commits on Dec 30, 2024
PROTOTYPE_VERSION = 522e69ec8a7c69c67e9e6dfc79ccdcbaaec2a0e0
PROTOTYPE_SITE = $(call github,ptitSeb,prototype,$(PROTOTYPE_VERSION))

PROTOTYPE_DEPENDENCIES = sdl2 sdl2_mixer
PROTOTYPE_LICENSE = GPL-2.0

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
PROTOTYPE_CONF_OPTS += LINUX=1
else
PROTOTYPE_CONF_OPTS += RPI4=1
endif

define PROTOTYPE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
	CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	AS="$(TARGET_CC)" LD="$(TARGET_CXX)" STRIP="$(TARGET_STRIP)" \
	LDFLAGS="-L$(STAGING_DIR)/lib64 -lm -L$(STAGING_DIR)/usr/lib -lSDL2 -lSDL2_mixer -lGL" \
	-C $(@D) -f Makefile SDL2=1 $(PROTOTYPE_CONF_OPTS)
endef

define PROTOTYPE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/prototype
	$(INSTALL) -D $(@D)/prototype $(TARGET_DIR)/usr/bin/prototype
	chmod 0755 $(TARGET_DIR)/usr/bin/prototype
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/prototype
	touch $(TARGET_DIR)/usr/share/emulationstation/ports/prototype/Prototype.game
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/prototype/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/prototype
	# evmap config
	cp -av $(@D)/Data $(TARGET_DIR)/usr/share/prototype
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/prototype/prototype.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
