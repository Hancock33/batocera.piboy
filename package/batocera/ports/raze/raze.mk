################################################################################
#
# raze
#
################################################################################
# Version: Commits on Sept 26, 2022
RAZE_VERSION = c23d23ea60e1283888251eb90ae5e312a7caa23d
RAZE_SITE = $(call github,ZDoom,Raze,$(RAZE_VERSION))
RAZE_LICENSE = GPLv2
RAZE_DEPENDENCIES = sdl2 bzip2 fluidsynth openal mesa3d libglu libglew zmusic gzdoom

RAZE_SUPPORTS_IN_SOURCE_BUILD = NO
RAZE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
RAZE_CONF_OPTS += -DNO_GTK=ON
RAZE_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
RAZE_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake
RAZE_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/raze"
RAZE_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/raze/"

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    RAZE_CONF_OPTS += -DHAVE_VULKAN=ON
else
    RAZE_CONF_OPTS += -DHAVE_VULKAN=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    RAZE_CONF_OPTS += -DHAVE_GLES2=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    RAZE_CONF_OPTS += -DHAVE_GLES2=ON
else
    RAZE_CONF_OPTS += -DHAVE_GLES2=OFF
endif

define RAZE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/raze
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/raze $(TARGET_DIR)/usr/share/raze/raze
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/raze.pk3 $(TARGET_DIR)/usr/share/raze/raze.pk3
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/soundfonts/raze.sf2 $(TARGET_DIR)/usr/share/raze/raze.sf2
	cp $(@D)/buildroot-build/libraries/discordrpc/src/libdiscord-rpc.so $(TARGET_DIR)/usr/lib
    mkdir -p $(TARGET_DIR)/usr/share/evmapy
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/raze/raze.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
