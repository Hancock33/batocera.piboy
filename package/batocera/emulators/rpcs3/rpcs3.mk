################################################################################
#
# rpcs3
#
################################################################################
# Version: Commits on Apr 25, 2023
RPCS3_VERSION = 957713015a9f5873511fca33fa875f1d9ea83fad
RPCS3_SITE = https://github.com/RPCS3/rpcs3.git
RPCS3_SITE_METHOD=git
RPCS3_GIT_SUBMODULES=YES
RPCS3_LICENSE = GPLv2
RPCS3_DEPENDENCIES += qt6base qt6multimedia qt6svg libxml2 mesa3d libglu openal alsa-lib
RPCS3_DEPENDENCIES += libevdev libglew libusb ffmpeg faudio wolfssl host-ninja

RPCS3_SUPPORTS_IN_SOURCE_BUILD = NO

RPCS3_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -GNinja\
    -DCMAKE_CROSSCOMPILING=ON -DBUILD_SHARED_LIBS=OFF \
    -DUSE_SYSTEM_FFMPEG=ON -DUSE_NATIVE_INSTRUCTIONS=OFF -DUSE_SYSTEM_CURL=ON

define RPCS3_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(RPCS3_BUILDDIR)
endef

define RPCS3_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(RPCS3_BUILDDIR)
endef

define RPCS3_INSTALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/rpcs3/evmapy.keys \
	    $(TARGET_DIR)/usr/share/evmapy/ps3.keys
endef

RPCS3_POST_INSTALL_TARGET_HOOKS = RPCS3_INSTALL_EVMAPY

$(eval $(cmake-package))
