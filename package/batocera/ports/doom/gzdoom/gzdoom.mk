################################################################################
#
# gzdoom
#
################################################################################
# Version: Commits on Dec 31, 2022
GZDOOM_VERSION = g4.10.0
GZDOOM_SITE = $(call github,ZDoom,gzdoom,$(GZDOOM_VERSION))
GZDOOM_LICENSE = GPL-3.0
GZDOOM_DEPENDENCIES = sdl2 bzip2 fluidsynth openal mesa3d libglu libglew host-zmusic zmusic

GZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO
GZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
GZDOOM_CONF_OPTS += -DCMAKE_RULE_MESSAGES=OFF
GZDOOM_CONF_OPTS += -DCMAKE_C_FLAGS_RELEASE="-DNDEBUG"
GZDOOM_CONF_OPTS += -DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
GZDOOM_CONF_OPTS += -DNO_GTK=ON
GZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
GZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake
GZDOOM_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/gzdoom"
GZDOOM_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/gzdoom"

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    GZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
else
    GZDOOM_CONF_OPTS += -DHAVE_VULKAN=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_GLES2)$(BR2_PACKAGE_BATOCERA_GLES3),y)
    GZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
	GZDOOM_POST_PATCH_HOOKS += GZDOOM_PATCH_USE_GLES2
else
    GZDOOM_CONF_OPTS += -DHAVE_GLES2=OFF
endif

define GZDOOM_PATCH_USE_GLES2
	$(SED) 's%#define USE_GLES2 0%#define USE_GLES2 1%' $(@D)/src/common/rendering/gles/gles_system.h
	$(SED) '1i #define __ANDROID__' $(@D)/src/common/rendering/gles/gles_system.cpp
endef

define GZDOOM_INSTALL
	cp $(@D)/buildroot-build/libraries/discordrpc/src/libdiscord-rpc.so $(TARGET_DIR)/usr/lib
	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/gzdoom
	mv $(TARGET_DIR)/usr/bin/gzdoom $(TARGET_DIR)/usr/share/gzdoom/gzdoom
endef

GZDOOM_POST_INSTALL_TARGET_HOOKS += GZDOOM_INSTALL

$(eval $(cmake-package))
$(eval $(host-cmake-package))
