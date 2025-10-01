################################################################################
#
# lindbergh-loader
#
################################################################################
# Version: Commits on Sept 30, 2025
LINDBERGH_LOADER_VERSION = 813ea1c49d4b96925c06c8f1b4caf9e8a749b405
LINDBERGH_LOADER_SITE = $(call github,lindbergh-loader,lindbergh-loader,$(LINDBERGH_LOADER_VERSION))
LINDBERGH_LOADER_LICENSE = ShareAlike 4.0 International
LINDBERGH_LOADER_LICENSE_FILES = LICENSE.md

ifeq ($(BR2_x86_64),y)
LINDBERGH_LOADER_DEPENDENCIES = wine-x86 dmidecode ossp
endif

ifeq ($(BR2_i386),y)
LINDBERGH_LOADER_DEPENDENCIES += alsa-lib alsa-plugins alsa-utils faudio libfreeglut pcsc-lite
LINDBERGH_LOADER_DEPENDENCIES += libglew sdl3 sdl3_image sdl3_ttf ncurses openal pipewire xlib_libX11 libbsd
LINDBERGH_LOADER_DEPENDENCIES += xlib_libXcursor xlib_libXext xlib_libXi xlib_libXmu xlib_libXScrnSaver

# match the makefile cflags
LINDBERGH_LOADER_CFLAGS = -g -pipe -fPIC -I$(STAGING_DIR)/usr/include -flto
# match the makefile ldflags
LINDBERGH_LOADER_LDFLAGS += -L$(STAGING_DIR)/usr/lib
LINDBERGH_LOADER_LDFLAGS += -flto -Wl,-z,defs -rdynamic -static-libgcc -lc -ldl -lGL
LINDBERGH_LOADER_LDFLAGS += -lglut -lX11 -lXcursor -lSDL3 -lSDL3_image -lSDL3_ttf -lFAudio -lm -lpthread -shared -lgcc_s -lgcc
LINDBERGH_LOADER_LDFLAGS += -nostdlib -lasound -L./src/libxdiff -lxdiff

define LINDBERGH_LOADER_BUILD_CMDS
	$(MAKE) \
	CC="$(TARGET_CC)" \
	CFLAGS_FOR_BUILD="-I$(STAGING_DIR)/usr/include" \
	CFLAGS="$(LINDBERGH_LOADER_CFLAGS)" \
	CXX="$(TARGET_CXX)" \
	CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
	LDFLAGS="$(LINDBERGH_LOADER_LDFLAGS)" \
	AR="$(TARGET_AR)" \
	-C $(@D) all
endef

define LINDBERGH_LOADER_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/lindbergh
	mkdir -p $(TARGET_DIR)/usr/lib32/extralibs
	cp -fv $(@D)/build/* $(TARGET_DIR)/usr/bin/lindbergh/
	cp -fv $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/lindbergh-loader/lib*.so* $(TARGET_DIR)/usr/lib32/extralibs
	mv $(TARGET_DIR)/usr/bin/lindbergh/lib* $(TARGET_DIR)/usr/lib32/extralibs
	LD_LIBRARY_PATH=$(TARGET_DIR)/usr/lib32:$(TARGET_DIR)/usr/bin/lindbergh $(TARGET_DIR)/usr/bin/lindbergh/lindbergh --create config $(TARGET_DIR)/usr/bin/lindbergh/lindbergh.ini
	sed -i "s|FULLSCREEN = false|FULLSCREEN = true|" $(TARGET_DIR)/usr/bin/lindbergh/lindbergh.ini
endef
endif

$(eval $(generic-package))
