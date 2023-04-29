################################################################################
#
# dolphin-triforce
#
################################################################################
# Version: Commits on Mar 15, 2023
DOLPHIN_TRIFORCE_VERSION = 6b7664dd230de299bae22150be77f4766cddde83
DOLPHIN_TRIFORCE_SITE = https://crediar.dev/crediar/dolphin.git
DOLPHIN_TRIFORCE_SITE_METHOD = git
DOLPHIN_TRIFORCE_LICENSE = GPLv2+
DOLPHIN_TRIFORCE_GIT_SUBMODULES = YES
DOLPHIN_TRIFORCE_SUPPORTS_IN_SOURCE_BUILD = NO

DOLPHIN_TRIFORCE_DEPENDENCIES = libevdev ffmpeg zlib libpng lzo libusb libcurl
DOLPHIN_TRIFORCE_DEPENDENCIES += bluez5_utils hidapi xz host-xz sdl2 host-ninja
DOLPHIN_TRIFORCE_DEPENDENCIES += xserver_xorg-server qt6base

DOLPHIN_TRIFORCE_CONF_OPTS += -DDISTRIBUTOR='batocera.linux'
DOLPHIN_TRIFORCE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DUSE_UPNP=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_TESTS=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DUSE_MGBA=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_AUTOUPDATE=OFF
DOLPHIN_TRIFORCE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
DOLPHIN_TRIFORCE_CONF_OPTS += -DENABLE_ANALYTICS=OFF

define DOLPHIN_TRIFORCE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(DOLPHIN_TRIFORCE_BUILDDIR)
endef

define DOLPHIN_TRIFORCE_INSTALL_TARGET_CMDS
    cp $(@D)/buildroot-build/Binaries/dolphin-emu $(TARGET_DIR)/usr/bin/dolphin-triforce
    mkdir -p $(TARGET_DIR)/usr/share/evmapy
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

DOLPHIN_TRIFORCE_POST_INSTALL_TARGET_HOOKS += DOLPHIN_TRIFORCE_EVMAPY

$(eval $(cmake-package))
