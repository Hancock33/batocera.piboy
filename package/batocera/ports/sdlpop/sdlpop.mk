################################################################################
#
# sdlpop
#
################################################################################
# Version: Commits on May 11, 2024
SDLPOP_VERSION = be89e134e6f19ca5a9d4442b1ecfa2ccf2b3c6e2
SDLPOP_SITE = $(call github,NagyD,SDLPoP,$(SDLPOP_VERSION))
SDLPOP_SUBDIR = src
SDLPOP_LICENSE = GPLv3
SDLPOP_DEPENDENCIES = sdl2 sdl2_image

define SDLPOP_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/src/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
	CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
	-C $(@D)/src -f Makefile
endef

define SDLPOP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/SDLPoP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	mkdir -p $(TARGET_DIR)/usr/share/SDLPoP/cfg
	$(INSTALL) -m 0755 $(@D)/prince -D $(TARGET_DIR)/usr/bin/SDLPoP
	cp $(@D)/SDLPoP.ini $(TARGET_DIR)/usr/share/SDLPoP/cfg/SDLPoP.ini
	echo "# Blank cfg file for advanced configuration" > $(TARGET_DIR)/usr/share/SDLPoP/cfg/SDLPoP.cfg
	cp -pr $(@D)/data $(TARGET_DIR)/usr/share/SDLPoP/
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/sdlpop
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sdlpop/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/sdlpop/
	# evmap config
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sdlpop/sdlpop.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
