################################################################################
#
# lzdoom
#
################################################################################
# Version: Commits on Apr 10, 2022
LZDOOM_VERSION = 7f3de9e225deace07ac86dadbe41ccf45ceaae3e
LZDOOM_SITE = $(call github,drfrag666,gzdoom,$(LZDOOM_VERSION))
LZDOOM_LICENSE = GPL-3.0
LZDOOM_DEPENDENCIES = sdl2 bzip2 fluidsynth openal mesa3d libglu libglew host-zmusic zmusic

LZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO
LZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LZDOOM_CONF_OPTS += -DCMAKE_RULE_MESSAGES=OFF
LZDOOM_CONF_OPTS += -DCMAKE_C_FLAGS_RELEASE="-DNDEBUG"
LZDOOM_CONF_OPTS += -DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
LZDOOM_CONF_OPTS += -DNO_GTK=ON
LZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
LZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake
LZDOOM_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/lzdoom"
LZDOOM_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/lzdoom"

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    LZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
else
    LZDOOM_CONF_OPTS += -DHAVE_VULKAN=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    LZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
else
    LZDOOM_CONF_OPTS += -DHAVE_GLES2=OFF
endif

define LZDOOM_INSTALL
	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/lzdoom
	mv $(TARGET_DIR)/usr/bin/lzdoom $(TARGET_DIR)/usr/share/lzdoom/lzdoom
endef

LZDOOM_POST_INSTALL_TARGET_HOOKS += LZDOOM_INSTALL

$(eval $(cmake-package))
