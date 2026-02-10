################################################################################
#
# dolphin-triforce
#
################################################################################
# Version: Commits on Feb 09, 2026
DOLPHIN_TRIFORCE_VERSION = 249d0bdcd4e3bed3c981c56dfea912e8dd47d8b2
DOLPHIN_TRIFORCE_SITE = https://github.com/crediar/dolphin.git
DOLPHIN_TRIFORCE_SITE_METHOD = git
DOLPHIN_TRIFORCE_LICENSE = GPLv2+
DOLPHIN_TRIFORCE_GIT_SUBMODULES = YES
DOLPHIN_TRIFORCE_SUPPORTS_IN_SOURCE_BUILD = NO

DOLPHIN_TRIFORCE_DEPENDENCIES += bluez5_utils cpp-ipc ffmpeg hidapi host-xz libcurl libevdev libpng libusb lzo sdl3 xz zlib
DOLPHIN_TRIFORCE_EMULATOR_INFO = dolphin_triforce.emulator.yml

DOLPHIN_TRIFORCE_MAKE_ENV += LDFLAGS="-Wl,--copy-dt-needed-entries"
DOLPHIN_TRIFORCE_CONF_ENV += LDFLAGS="-Wl,--copy-dt-needed-entries"
DOLPHIN_TRIFORCE_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -flto"
DOLPHIN_TRIFORCE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -flto"
DOLPHIN_TRIFORCE_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-lstdc++ -flto"

DOLPHIN_TRIFORCE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DDISTRIBUTOR='batocera.linux'
DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_ANALYTICS=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_AUTOUPDATE=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_CLI_TOOL=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_LTO=ON
DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_TESTS=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DUSE_MGBA=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DUSE_RETRO_ACHIEVEMENTS=ON
DOLPHIN_TRIFORCE_CONF_OPTS += -DUSE_UPNP=OFF

ifeq ($(BR2_PACKAGE_QT6),y)
    DOLPHIN_TRIFORCE_DEPENDENCIES += qt6base qt6svg
    DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_QT=ON
    DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_NOGUI=ON
else
    DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_QT=OFF
    DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_NOGUI=ON
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
    DOLPHIN_TRIFORCE_DEPENDENCIES += xserver_xorg-server
    DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_X11=ON
else
    DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_X11=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_VULKAN=ON
else
    DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

define DOLPHIN_TRIFORCE_EXTRAS
	mkdir -p $(TARGET_DIR)/usr/share/triforce
	# copy extra ini files
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/*.ini $(TARGET_DIR)/usr/share/triforce
	# Virtua Striker 2002 (Japan)
	#cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/ $(TARGET_DIR)/usr/share/triforce/GEYJ6E.ini
	# Virtua Striker 2002 (Export, Type3)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBEY.ini $(TARGET_DIR)/usr/share/triforce/GEYP6E.ini
	# F-ZERO AX
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBGG.ini $(TARGET_DIR)/usr/share/triforce/GGGE6E.ini
	# F-ZERO AX (Monster)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBHA.ini $(TARGET_DIR)/usr/share/triforce/GHAE6E.ini
	# VIRTUA STRIKER 4 (Asia)
	#cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/ $(TARGET_DIR)/usr/share/triforce/GHZW6E.ini
	# VIRTUA STRIKER 4 (Export)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBJA.ini $(TARGET_DIR)/usr/share/triforce/GJAP6E.ini
	# Mario Kart GP
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBKP.ini $(TARGET_DIR)/usr/share/triforce/GKPJ6E.ini
	# VIRTUA STRIKER 4 Ver.2006 (Japan)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBLK.ini $(TARGET_DIR)/usr/share/triforce/GLKJ6E.ini
	# VIRTUA STRIKER 4 Ver.2006 (Export)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBLL.ini $(TARGET_DIR)/usr/share/triforce/GLLP6E.ini
	# Mario Kart Arcade GP2
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBNL.ini $(TARGET_DIR)/usr/share/triforce/GNLJ82.ini

	cd $(TARGET_DIR)/usr/bin && ln -sf dolphin-triforce dolphin-triforce.desktopconfig
endef

DOLPHIN_TRIFORCE_POST_INSTALL_TARGET_HOOKS += DOLPHIN_TRIFORCE_EXTRAS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
