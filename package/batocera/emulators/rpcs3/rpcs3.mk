################################################################################
#
# rpcs3
#
################################################################################
# Version: Commits on Sept 02, 2023
RPCS3_VERSION = 11006dac35544f3fd990fb7c6c6fc1a0e313d26a
RPCS3_SITE = https://github.com/RPCS3/rpcs3.git
RPCS3_SITE_METHOD=git
RPCS3_GIT_SUBMODULES=YES
RPCS3_LICENSE = GPLv2
RPCS3_DEPENDENCIES += alsa-lib faudio ffmpeg libevdev
RPCS3_DEPENDENCIES += libglew libglu libpng libusb mesa3d ncurses openal
RPCS3_DEPENDENCIES += qt6base qt6multimedia qt6svg
RPCS3_DEPENDENCIES += wolfssl libxml2
RPCS3_SUPPORTS_IN_SOURCE_BUILD = NO

RPCS3_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
RPCS3_CONF_OPTS += -DCMAKE_CROSSCOMPILING=ON
RPCS3_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
RPCS3_CONF_OPTS += -DUSE_NATIVE_INSTRUCTIONS=OFF
RPCS3_CONF_OPTS += -DBUILD_LLVM_SUBMODULE=OFF
RPCS3_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm/
RPCS3_CONF_OPTS += -DUSE_PRECOMPILED_HEADERS=OFF
RPCS3_CONF_OPTS += -DSTATIC_LINK_LLVM=OFF
RPCS3_CONF_OPTS += -DUSE_SYSTEM_FFMPEG=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_CURL=ON
RPCS3_CONF_OPTS += -DUSE_SDL=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_SDL=ON

RPCS3_CONF_ENV = LIBS="-ncurses -ltinfo"

define RPCS3_INSTALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0644 \
		$(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/rpcs3/evmapy.keys \
		$(TARGET_DIR)/usr/share/evmapy/ps3.keys
endef

RPCS3_POST_INSTALL_TARGET_HOOKS = RPCS3_INSTALL_EVMAPY

$(eval $(cmake-package))
