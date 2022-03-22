################################################################################
#
# GZDOOM
#
################################################################################
# Version.: Commits on Mar 22, 2022
GZDOOM_VERSION = a685754abfd7aba82fc14d153ff9ba43ef13ca55
GZDOOM_SITE = $(call github,coelckers,gzdoom,$(GZDOOM_VERSION))

GZDOOM_DEPENDENCIES = sdl2 sdl2_mixer host-zmusic zmusic
GZDOOM_LICENSE = GPL-2.0

GZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO

GZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
GZDOOM_CONF_OPTS += -DNO_GTK=ON
GZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
GZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
GZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
GZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake
GZDOOM_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/gzdoom"
GZDOOM_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/gzdoom"

define GZDOOM_KEYS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/gzdoom/prboom.gzdoom.keys $(TARGET_DIR)/usr/share/evmapy
endef

GZDOOM_PRE_INSTALL_TARGET_HOOKS += GZDOOM_KEYS

$(eval $(cmake-package))
$(eval $(host-cmake-package))
