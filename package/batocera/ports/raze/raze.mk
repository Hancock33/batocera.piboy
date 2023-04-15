################################################################################
#
# raze
#
################################################################################
# Version: Commits on Apr 15, 2023
RAZE_VERSION = 17cde1e3ca2f279b28669acff89d814d2ecc9e82
RAZE_SITE = $(call github,ZDoom,Raze,$(RAZE_VERSION))
RAZE_LICENSE = GPLv2
RAZE_DEPENDENCIES = sdl2 bzip2 fluidsynth openal mesa3d libglu libglew zmusic gzdoom

RAZE_SUPPORTS_IN_SOURCE_BUILD = NO
RAZE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
RAZE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
RAZE_CONF_OPTS += -DNO_GTK=ON
RAZE_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
RAZE_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake
RAZE_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/raze"
RAZE_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/raze/"
RAZE_CONF_OPTS += -DPROGDIR="/usr/share/raze"

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    RAZE_CONF_OPTS += -DHAVE_VULKAN=ON
else
    RAZE_CONF_OPTS += -DHAVE_VULKAN=OFF
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

$(eval $(cmake-package))
