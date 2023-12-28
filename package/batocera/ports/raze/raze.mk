################################################################################
#
# raze
#
################################################################################
# Version: Commits on Nov 27, 2023 (branch@1.8)
RAZE_VERSION = d26dfa28b99a218e43a77813870934fc77e74139
RAZE_SITE = $(call github,ZDoom,Raze,$(RAZE_VERSION))
RAZE_LICENSE = GPLv2
RAZE_DEPENDENCIES = sdl2 bzip2 fluidsynth openal mesa3d libglu libglew zmusic webp host-zmusic host-raze
HOST_RAZE_DEPENDENCIES = host-webp
RAZE_SUPPORTS_IN_SOURCE_BUILD = NO

# We need the tools from the host package to build the target package
HOST_RAZE_DEPENDENCIES = zlib bzip2
HOST_RAZE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
HOST_RAZE_CONF_OPTS += -DSKIP_INSTALL_ALL=ON
HOST_RAZE_CONF_OPTS += -DTOOLS_ONLY=ON
HOST_RAZE_CONF_OPTS += -DHAVE_VULKAN=OFF
HOST_RAZE_SUPPORTS_IN_SOURCE_BUILD = NO

define HOST_RAZE_INSTALL_CMDS
	# Skip install as we only need `ImportExecutables.cmake` from the build directory.
endef

RAZE_CONF_OPTS += -DNO_GTK=ON
RAZE_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
RAZE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
RAZE_CONF_OPTS += -DIMPORT_EXECUTABLES="$(HOST_RAZE_BUILDDIR)/ImportExecutables.cmake"
RAZE_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/raze"
RAZE_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/raze/"
RAZE_CONF_OPTS += -DPROGDIR="/usr/share/raze"

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
	RAZE_CONF_OPTS += -DHAVE_VULKAN=ON
	RAZE_DEPENDENCIES += vulkan-headers vulkan-loader
	ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
		RAZE_CONF_OPTS += -DVULKAN_USE_XLIB=ON -DVULKAN_USE_WAYLAND=OFF
	else ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_SWAY),yy)
		RAZE_CONF_OPTS += -DVULKAN_USE_XLIB=OFF -DVULKAN_USE_WAYLAND=ON
	endif
else
	RAZE_CONF_OPTS += -DHAVE_VULKAN=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
	RAZE_CONF_OPTS += -DHAVE_GLES2=ON
	RAZE_DEPENDENCIES += libgles
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
	RAZE_CONF_OPTS += -DHAVE_GLES2=ON
	RAZE_DEPENDENCIES += libgles
else
	RAZE_CONF_OPTS += -DHAVE_GLES2=OFF
	RAZE_DEPENDENCIES += libgl
endif

define RAZE_INSTALL
	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/raze
	mv $(TARGET_DIR)/usr/bin/raze $(TARGET_DIR)/usr/share/raze/raze
	mkdir -p $(TARGET_DIR)/usr/share/raze/soundfonts
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/soundfonts/raze.sf2 $(TARGET_DIR)/usr/share/raze/soundfonts/raze.sf2

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/raze/raze.keys $(TARGET_DIR)/usr/share/evmapy
endef
RAZE_POST_INSTALL_TARGET_HOOKS += RAZE_INSTALL

$(eval $(cmake-package))
$(eval $(host-cmake-package))
