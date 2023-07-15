################################################################################
#
# cdogs
#
################################################################################
# Version: Commits on Jul 12, 2023
CDOGS_VERSION = 01d166204d632aa97d322e3b0ded261d5eca2166
CDOGS_SITE = $(call github,cxong,cdogs-sdl,$(CDOGS_VERSION))

CDOGS_DEPENDENCIES = sdl2 python-protobuf host-ninja
CDOGS_LICENSE = GPL-2.0

CDOGS_SUPPORTS_IN_SOURCE_BUILD = NO

define CDOGS_FIX_SDL2MAIN
	sed -i -e s+"SDL2_image::SDL2_image"+"-lSDL2_image"+ $(@D)/src/cdogs/CMakeLists.txt
	sed -i -e s+"SDL2_mixer::SDL2_mixer"+"-lSDL2_mixer"+ $(@D)/src/cdogs/CMakeLists.txt
	sed -i -e s+"SDL2_image::SDL2_image"+"-lSDL2_image"+ $(@D)/src/tests/CMakeLists.txt
endef

CDOGS_PRE_CONFIGURE_HOOKS += CDOGS_FIX_SDL2MAIN

CDOGS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
CDOGS_CONF_OPTS += -DCDOGS_DATA_DIR=/usr/share/cdogs/
CDOGS_CONF_OPTS += -DBUILD_EDITOR=OFF

define CDOGS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(CDOGS_BUILDDIR)
endef

define CDOGS_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/buildroot-build/src/cdogs-sdl $(TARGET_DIR)/usr/bin/cdogs
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/cdogs
	mkdir -p $(TARGET_DIR)/usr/share/cdogs
    cp -pa $(@D)/data      $(TARGET_DIR)/usr/share/cdogs
    cp -pa $(@D)/dogfights $(TARGET_DIR)/usr/share/cdogs
    cp -pa $(@D)/graphics  $(TARGET_DIR)/usr/share/cdogs
    cp -pa $(@D)/missions  $(TARGET_DIR)/usr/share/cdogs
    cp -pa $(@D)/music     $(TARGET_DIR)/usr/share/cdogs
    cp -pa $(@D)/sounds    $(TARGET_DIR)/usr/share/cdogs
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/cdogs/media/*              $(TARGET_DIR)/usr/share/emulationstation/ports/cdogs/

    # evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/cdogs/cdogs.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
