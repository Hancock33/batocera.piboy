################################################################################
#
# uzdoom
#
################################################################################
# Version: Commits on Sept 17, 2026
UZDOOM_VERSION = cbe70941a63f59003be2129c5a1dfa16cfb092a5
UZDOOM_SITE = https://github.com/UZDoom/UZDoom.git
UZDOOM_SITE_METHOD = git
UZDOOM_LICENSE = GPLv3
UZDOOM_DEPENDENCIES = host-uzdoom sdl2 bzip2 fluidsynth openal zmusic libvpx webp
UZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO
UZDOOM_EMULATOR_INFO = uzdoom.emulator.yml

# We need the tools from the host package to build the target package
HOST_UZDOOM_DEPENDENCIES = bzip2 host-webp zlib
HOST_UZDOOM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
HOST_UZDOOM_CONF_OPTS += -DSKIP_INSTALL_ALL=ON
HOST_UZDOOM_CONF_OPTS += -DTOOLS_ONLY=ON
HOST_UZDOOM_CONF_OPTS += -DZMUSIC_SYSTEM_INSTALL=ON
HOST_UZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO

define HOST_UZDOOM_INSTALL_CMDS
	# Skip install as we only need `ImportExecutables.cmake` from the build directory.
endef

UZDOOM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
UZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
UZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_UZDOOM_BUILDDIR)/ImportExecutables.cmake
UZDOOM_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/uzdoom"
UZDOOM_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/uzdoom"
UZDOOM_CONF_OPTS += -DNO_GTK=ON
UZDOOM_CONF_OPTS += -DNO_SDL_JOYSTICK=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
        UZDOOM_DEPENDENCIES += xlib_libX11 vulkan-headers vulkan-loader
        UZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
        UZDOOM_CONF_OPTS += -DVULKAN_USE_XLIB=ON -DVULKAN_USE_WAYLAND=OFF
    else ifeq ($(BR2_PACKAGE_WAYLAND),y)
        UZDOOM_DEPENDENCIES += wayland vulkan-headers vulkan-loader
        UZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
        UZDOOM_CONF_OPTS += -DVULKAN_USE_XLIB=OFF -DVULKAN_USE_WAYLAND=ON
    else
        UZDOOM_CONF_OPTS += -DHAVE_VULKAN=OFF
    endif
else
    UZDOOM_CONF_OPTS += -DHAVE_VULKAN=OFF
endif

ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    UZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
    UZDOOM_DEPENDENCIES += libgles
else
    UZDOOM_CONF_OPTS += -DHAVE_GLES2=OFF
    UZDOOM_DEPENDENCIES += libgl
endif

define UZDOOM_INSTALL
	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/uzdoom
	mv $(TARGET_DIR)/usr/bin/uzdoom $(TARGET_DIR)/usr/share/uzdoom/uzdoom
endef

UZDOOM_POST_INSTALL_TARGET_HOOKS += UZDOOM_INSTALL

$(eval $(cmake-package))
$(eval $(host-cmake-package))
$(eval $(emulator-info-package))
