################################################################################
#
# raze
#
################################################################################
# Version: Commits on Dec 10, 2023
RAZE_VERSION = 1e618d2fdb0860018dfbc051e883660241d541b9
RAZE_SITE = $(call github,ZDoom,Raze,$(RAZE_VERSION))
RAZE_LICENSE = GPLv2
RAZE_DEPENDENCIES = sdl2 bzip2 fluidsynth openal mesa3d libglu libglew zmusic webp host-zmusic host-raze
HOST_RAZE_DEPENDENCIES = host-webp
RAZE_SUPPORTS_IN_SOURCE_BUILD = NO

RAZE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
RAZE_CONF_OPTS += -DNO_GTK=ON
RAZE_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
RAZE_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_RAZE_BUILDDIR)/ImportExecutables.cmake
RAZE_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/raze"
RAZE_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/raze/"
RAZE_CONF_OPTS += -DPROGDIR="/usr/share/raze"

# ZVulkan has an X11 dependency
ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
	ifeq ($(BR2_PACKAGE_XORG7),y)
		RAZE_CONF_OPTS += -DHAVE_VULKAN=ON
		HOST_RAZE_CONF_OPTS += -DHAVE_VULKAN=ON
		RAZE_DEPENDENCIES += vulkan-headers vulkan-loader
	else
		RAZE_CONF_OPTS += -DHAVE_VULKAN=OFF
		HOST_RAZE_CONF_OPTS += -DHAVE_VULKAN=OFF
	endif
else
	RAZE_CONF_OPTS += -DHAVE_VULKAN=OFF
	HOST_RAZE_CONF_OPTS += -DHAVE_VULKAN=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_GLES2)$(BR2_PACKAGE_BATOCERA_GLES3),y)
	RAZE_CONF_OPTS += -DHAVE_GLES2=ON
else
	RAZE_CONF_OPTS += -DHAVE_GLES2=OFF
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

define HOST_RAZE_BUILDTOOLS
	sed -i '/( wadsrc )/d' $(@D)/CMakeLists.txt
	sed -i '/( source )/d' $(@D)/CMakeLists.txt
endef
HOST_RAZE_PRE_CONFIGURE_HOOKS += HOST_RAZE_BUILDTOOLS

$(eval $(cmake-package))
$(eval $(host-cmake-package))
