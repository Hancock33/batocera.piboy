################################################################################
#
# gzdoom
#
################################################################################
# Version: Commits on Nov 06, 2022
GZDOOM_VERSION = 182ee4eff5e2119ee7aed8ea0819c4c83c6831c7
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

ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    GZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    GZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
else
    GZDOOM_CONF_OPTS += -DHAVE_GLES2=OFF
endif

define GZDOOM_INSTALL
	cp $(@D)/buildroot-build/libraries/discordrpc/src/libdiscord-rpc.so $(TARGET_DIR)/usr/lib
	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/gzdoom
	mv $(TARGET_DIR)/usr/bin/gzdoom $(TARGET_DIR)/usr/share/gzdoom/gzdoom
endef

GZDOOM_POST_INSTALL_TARGET_HOOKS += GZDOOM_INSTALL

$(eval $(cmake-package))
$(eval $(host-cmake-package))
