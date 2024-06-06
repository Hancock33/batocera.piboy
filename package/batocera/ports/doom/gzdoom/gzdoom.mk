################################################################################
#
# gzdoom
#
################################################################################
# Version: Commits on Jun 05, 2024
GZDOOM_VERSION = c693e3b0731707351cd166aa160aaa7803751d89
GZDOOM_SITE = $(call github,ZDoom,gzdoom,$(GZDOOM_VERSION))
GZDOOM_LICENSE = GPL-3.0
GZDOOM_DEPENDENCIES = sdl2 bzip2 fluidsynth openal mesa3d libglu libglew zmusic libvpx webp host-zmusic host-gzdoom
GZDOOM_SUPPORTS_IN_SOURCE_BUILD = YES

# We need the tools from the host package to build the target package
HOST_GZDOOM_DEPENDENCIES = zlib bzip2 host-webp
HOST_GZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
HOST_GZDOOM_CONF_OPTS += -DSKIP_INSTALL_ALL=ON
HOST_GZDOOM_CONF_OPTS += -DTOOLS_ONLY=ON
HOST_GZDOOM_CONF_OPTS += -DHAVE_VULKAN=OFF
HOST_GZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO

define HOST_GZDOOM_INSTALL_CMDS
	# Skip install as we only need `ImportExecutables.cmake` from the build directory.
endef

GZDOOM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
GZDOOM_CONF_OPTS += -DNO_GTK=ON
GZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
GZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake
GZDOOM_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/gzdoom"
GZDOOM_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/gzdoom"

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
	GZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
	GZDOOM_DEPENDENCIES += vulkan-headers vulkan-loader
	ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
		GZDOOM_CONF_OPTS += -DVULKAN_USE_XLIB=ON -DVULKAN_USE_WAYLAND=OFF
	else ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_SWAY),yy)
		GZDOOM_CONF_OPTS += -DVULKAN_USE_XLIB=OFF -DVULKAN_USE_WAYLAND=ON
	endif
else
	GZDOOM_CONF_OPTS += -DHAVE_VULKAN=OFF
endif

ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	GZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
	GZDOOM_DEPENDENCIES += libgles
else
	GZDOOM_CONF_OPTS += -DHAVE_GLES2=OFF
	GZDOOM_DEPENDENCIES += libgl
endif

define GZDOOM_INSTALL
	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/gzdoom
	mv $(TARGET_DIR)/usr/bin/gzdoom $(TARGET_DIR)/usr/share/gzdoom/gzdoom
endef

GZDOOM_POST_INSTALL_TARGET_HOOKS += GZDOOM_INSTALL

$(eval $(cmake-package))
$(eval $(host-cmake-package))
