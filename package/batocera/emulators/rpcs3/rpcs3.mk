################################################################################
#
# rpcs3
#
################################################################################
# Version: Commits on Jul 31, 2023
RPCS3_VERSION = d34287b2cc8899b224bf783296d01cf221b065ba
RPCS3_SITE = https://github.com/RPCS3/rpcs3.git
RPCS3_SITE_METHOD=git
RPCS3_GIT_SUBMODULES=YES
RPCS3_LICENSE = GPLv2
RPCS3_DEPENDENCIES += alsa-lib faudio ffmpeg libevdev
RPCS3_DEPENDENCIES += libglew libglu libpng libusb mesa3d ncurses openal 
RPCS3_DEPENDENCIES += qt6base qt6multimedia qt6svg host-ninja
RPCS3_DEPENDENCIES += wolfssl libxml2

RPCS3_SUPPORTS_IN_SOURCE_BUILD = NO

RPCS3_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
RPCS3_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
RPCS3_CONF_OPTS += -DCMAKE_CROSSCOMPILING=ON
RPCS3_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
RPCS3_CONF_OPTS += -DUSE_NATIVE_INSTRUCTIONS=OFF
#RPCS3_CONF_OPTS += -DBUILD_LLVM_SUBMODULE=OFF
#RPCS3_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm/
#RPCS3_CONF_OPTS += -DSTATIC_LINK_LLVM=OFF
RPCS3_CONF_OPTS += -DBUILD_LLVM=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_FFMPEG=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_CURL=ON
RPCS3_CONF_OPTS += -DUSE_SDL=ON
RPCS3_CONF_OPTS += -DUSE_SYSTEM_SDL=ON
RPCS3_CONF_OPTS += -DUSE_PRECOMPILED_HEADERS=ON 

RPCS3_CONF_ENV = LIBS="-ncurses -ltinfo"

define RPCS3_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(RPCS3_BUILDDIR)
endef

define RPCS3_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(RPCS3_BUILDDIR)
endef

define RPCS3_INSTALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0644 \
	    $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/rpcs3/evmapy.keys \
	    $(TARGET_DIR)/usr/share/evmapy/ps3.keys
endef

RPCS3_POST_INSTALL_TARGET_HOOKS = RPCS3_INSTALL_EVMAPY

$(eval $(cmake-package))
