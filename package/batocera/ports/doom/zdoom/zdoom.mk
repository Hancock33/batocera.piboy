################################################################################
#
# ZDOOM
#
################################################################################
# Version.: Commits on Feb, 14, 2019 zdoomle branch
ZDOOM_VERSION = 93c9d6782ffe2ad35d582b516fec25b9d4257df3
ZDOOM_SITE = $(call github,drfrag666,gzdoom,$(ZDOOM_VERSION))

ZDOOM_DEPENDENCIES = sdl2 sdl2_mixer host-zmusic zmusic
ZDOOM_LICENSE = GPL-2.0

ZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO

HOST_ZDOOM_CONF_OPTS += -DFORCE_INTERNAL_GME=TRUE

ZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
ZDOOM_CONF_OPTS += -DNO_GTK=ON
ZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
ZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_ZDOOM_BUILDDIR)/ImportExecutables.cmake

define ZDOOM_KEYS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/zdoom/prboom.zdoom.keys $(TARGET_DIR)/usr/share/evmapy
endef

ZDOOM_PRE_INSTALL_TARGET_HOOKS += ZDOOM_KEYS

$(eval $(cmake-package))
$(eval $(host-cmake-package))
