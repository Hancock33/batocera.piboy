################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on Apr 29, 2023
DUCKSTATION_VERSION = a003832e33bb66857a5d9fe2d0ca11e9463771ed
DUCKSTATION_SITE = https://github.com/stenzek/duckstation.git
DUCKSTATION_SITE_METHOD=git
DUCKSTATION_GIT_SUBMODULES=YES
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_DEPENDENCIES = fmt boost ffmpeg libcurl ecm
DUCKSTATION_DEPENDENCIES += libdrm sdl2 libevdev host-ninja
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

DUCKSTATION_CONF_OPTS  = -DCMAKE_BUILD_TYPE=Release
DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
DUCKSTATION_CONF_OPTS += -DUSE_DRMKMS=ON
DUCKSTATION_CONF_OPTS += -GNinja
DUCKSTATION_CONF_ENV += LDFLAGS=-lpthread

ifeq ($(BR2_PACKAGE_QT6),y)
    DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=ON -DBUILD_NOGUI_FRONTEND=OFF
    DUCKSTATION_DEPENDENCIES += qt6base qt6svg qt6tools qt6multimedia
    X86_INSTALL=y
else
    DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=OFF -DBUILD_NOGUI_FRONTEND=ON
    X86_INSTALL=n
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
  DUCKSTATION_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-lmali_hook -Wl,--whole-archive -lmali_hook_injector -Wl,--no-whole-archive -lmali"
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
    DUCKSTATION_CONF_OPTS += -DUSE_WAYLAND=ON
else
    DUCKSTATION_CONF_OPTS += -DUSE_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
    DUCKSTATION_CONF_OPTS += -DUSE_X11=ON
else
    DUCKSTATION_CONF_OPTS += -DUSE_X11=OFF
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
else
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    DUCKSTATION_CONF_OPTS += -DUSE_GLX=ON
endif

ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
    DUCKSTATION_CONF_OPTS += -DUSE_EGL=ON
    ifeq ($(BR2_PACKAGE_HAS_LIBMALI),y)
        DUCKSTATION_CONF_OPTS += -DUSE_MALI=ON
    endif
else
    DUCKSTATION_CONF_OPTS += -DUSE_EGL=OFF
endif

define DUCKSTATION_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(DUCKSTATION_BUILDDIR)
endef

define DUCKSTATION_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/duckstation/bin
    @if [ "$(X86_INSTALL)" = "n" ]; then  $(INSTALL) -D $(@D)/buildroot-build/bin/duckstation-nogui $(TARGET_DIR)/usr/duckstation/bin/ ; fi
    @if [ "$(X86_INSTALL)" = "y" ]; then  cp -pr  $(@D)/buildroot-build/bin/translations            $(TARGET_DIR)/usr/duckstation/bin/ ; fi
    @if [ "$(X86_INSTALL)" = "y" ]; then  $(INSTALL) -D $(@D)/buildroot-build/bin/duckstation-qt    $(TARGET_DIR)/usr/duckstation/bin/duckstation-nogui ; fi
    $(INSTALL) -D $(@D)/buildroot-build/bin/duckstation* $(TARGET_DIR)/usr/duckstation/bin
    cp -pr  $(@D)/buildroot-build/bin/resources          $(TARGET_DIR)/usr/duckstation/bin/

    mkdir -p $(TARGET_DIR)/usr/share/evmapy
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/duckstation/psx.duckstation.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))