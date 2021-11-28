################################################################################
#
# LZDOOM
#
################################################################################
# Version.: Commits on Oct 30, 2021
GZDOOM_VERSION = 3270789f517d3904cd98a1bacc832be1a3194655
GZDOOM_SITE = $(call github,drfrag666,gzdoom,$(GZDOOM_VERSION))

GZDOOM_DEPENDENCIES = sdl2 sdl2_mixer host-zmusic zmusic
GZDOOM_LICENSE = GPL-2.0

GZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO

GZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
GZDOOM_CONF_OPTS += -DNO_GTK=ON
GZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
GZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake

define GZDOOM_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/neo/buildroot-build/idlib/libidlib.so $(TARGET_DIR)/usr/lib
	cp -pvr $(@D)/neo/buildroot-build/RBGZDOOMBFG $(TARGET_DIR)/usr/bin

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	#cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/bennugd/bennugd.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
