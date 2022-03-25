################################################################################
#
# LZDOOM
#
################################################################################
# Version: Commits on Dec 28, 2021
LZDOOM_VERSION = 5f2006df7577f5a42966986adb5bca302c71c626
LZDOOM_SITE = $(call github,drfrag666,gzdoom,$(LZDOOM_VERSION))

LZDOOM_DEPENDENCIES = sdl2 sdl2_mixer host-zmusic zmusic
LZDOOM_LICENSE = GPL-2.0

LZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO

LZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LZDOOM_CONF_OPTS += -DNO_GTK=ON
LZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
LZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
LZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_LZDOOM_BUILDDIR)/ImportExecutables.cmake
LZDOOM_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/lzdoom"
LZDOOM_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/lzdoom"

define LZDOOM_KEYS
	mkdir -p  $(TARGET_DIR)/usr/share/lzdoom
	cp -av $(@D)/soundfont $(TARGET_DIR)/usr/share/lzdoom
	cp -av $(@D)/fm_banks  $(TARGET_DIR)/usr/share/lzdoom
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/lzdoom/prboom.lzdoom.keys $(TARGET_DIR)/usr/share/evmapy
endef

LZDOOM_PRE_INSTALL_TARGET_HOOKS += LZDOOM_KEYS

$(eval $(cmake-package))
$(eval $(host-cmake-package))
