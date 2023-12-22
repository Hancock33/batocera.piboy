################################################################################
#
# gzdoom
#
################################################################################
# Version: Commits on Dec 22, 2023
GZDOOM_VERSION = 8151c4cab23cba95798e34fa4447da398ef0efd8
GZDOOM_SITE = $(call github,ZDoom,gzdoom,$(GZDOOM_VERSION))
GZDOOM_LICENSE = GPL-3.0
GZDOOM_DEPENDENCIES = sdl2 bzip2 fluidsynth openal mesa3d libglu libglew zmusic libvpx webp host-zmusic host-gzdoom
HOST_GZDOOM_DEPENDENCIES = host-webp
GZDOOM_SUPPORTS_IN_SOURCE_BUILD = YES

GZDOOM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
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
else
	GZDOOM_CONF_OPTS += -DHAVE_GLES2=OFF
endif

define GZDOOM_INSTALL
	$(TARGET_STRIP) $(TARGET_DIR)/usr/bin/gzdoom
	mv $(TARGET_DIR)/usr/bin/gzdoom $(TARGET_DIR)/usr/share/gzdoom/gzdoom
endef

GZDOOM_POST_INSTALL_TARGET_HOOKS += GZDOOM_INSTALL

define HOST_GZDOOM_BUILDTOOLS
	sed -i '/( wadsrc )/d' $(@D)/CMakeLists.txt
	sed -i '/( wadsrc_bm )/d' $(@D)/CMakeLists.txt
	sed -i '/( wadsrc_lights )/d' $(@D)/CMakeLists.txt
	sed -i '/( wadsrc_extra )/d' $(@D)/CMakeLists.txt
	sed -i '/( wadsrc_widepix )/d' $(@D)/CMakeLists.txt
	sed -i '/( src )/d' $(@D)/CMakeLists.txt
endef
HOST_GZDOOM_PRE_CONFIGURE_HOOKS += HOST_GZDOOM_BUILDTOOLS

$(eval $(cmake-package))
$(eval $(host-cmake-package))
