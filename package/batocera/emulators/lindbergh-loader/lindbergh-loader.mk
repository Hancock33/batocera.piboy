################################################################################
#
# lindbergh-loader
#
################################################################################
# Version: Commits on May 05, 2026
LINDBERGH_LOADER_VERSION = 987c329ff44a08e2e2fe51143723437ff7d7ac28
LINDBERGH_LOADER_SITE = $(call github,lindbergh-loader,linuxloader,$(LINDBERGH_LOADER_VERSION))
LINDBERGH_LOADER_LICENSE = ShareAlike 4.0 International
LINDBERGH_LOADER_LICENSE_FILES = LICENSE.md
LINDBERGH_LOADER_EMULATOR_INFO = lindbergh-loader.emulator.yml

ifeq ($(BR2_x86_64),y)
LINDBERGH_LOADER_DEPENDENCIES += wine-x86 dmidecode ossp
endif

ifeq ($(BR2_i386),y)
LINDBERGH_LOADER_DEPENDENCIES += alsa-lib alsa-plugins alsa-utils faudio libfreeglut pcsc-lite
LINDBERGH_LOADER_DEPENDENCIES += libglew sdl3 sdl3_image sdl3_ttf ncurses openal pipewire xlib_libX11 libbsd
LINDBERGH_LOADER_DEPENDENCIES += xlib_libXcursor xlib_libXext xlib_libXi xlib_libXmu xlib_libXScrnSaver
LINDBERGH_LOADER_IN_SOURCE_BUILD = NO

LINDBERGH_LOADER_CONF_OPTS += -DCMAKE_C_FLAGS=-std=gnu17

define LINDBERGH_LOADER_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/lindbergh
	mkdir -p $(TARGET_DIR)/usr/bin/lindbergh/extralibs
	cp -fv $(@D)/linuxloader* $(TARGET_DIR)/usr/bin/lindbergh/
	cp -fv $(@D)/lib*.so* $(TARGET_DIR)/usr/bin/lindbergh/
	LD_LIBRARY_PATH=$(STAGING_DIR)/lib:$(STAGING_DIR)/usr/lib $(@D)/build/lindbergh --create config $(TARGET_DIR)/usr/bin/lindbergh/linuxloader.ini
	cp -fv $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/lindbergh-loader/controls.ini $(TARGET_DIR)/usr/bin/lindbergh/
	cp -fv $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/lindbergh-loader/lib*.so*     $(TARGET_DIR)/usr/bin/lindbergh/extralibs
endef
endif

define LINDBERGH_LOADER_CROSSHAIRS
	mkdir -p $(TARGET_DIR)/usr/bin/lindbergh/crosshairs
	cp -fv $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/lindbergh-loader/crosshairs/* $(TARGET_DIR)/usr/bin/lindbergh/crosshairs/
endef

LINDBERGH_LOADER_POST_INSTALL_TARGET_HOOKS += LINDBERGH_LOADER_CROSSHAIRS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
