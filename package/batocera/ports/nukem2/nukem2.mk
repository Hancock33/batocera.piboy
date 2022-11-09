################################################################################
#
# nukem2
#
################################################################################
# Version: Commits on Nov 08, 2022
NUKEM2_VERSION = aa48d6b6112d099618fdd7f2f747b39d8c2ead7a
NUKEM2_SITE = https://github.com/lethal-guitar/RigelEngine.git
NUKEM2_SITE_METHOD=git
NUKEM2_GIT_SUBMODULES=YES

NUKEM2_DEPENDENCIES = sdl2 sdl2_mixer
NUKEM2_LICENSE = GPL-2.0

NUKEM2_SUPPORTS_IN_SOURCE_BUILD = NO

NUKEM2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
NUKEM2_CONF_OPTS += -DUSE_GL_ES=ON
NUKEM2_CONF_OPTS += -DWARNINGS_AS_ERRORS=OFF

define NUKEM2_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/src/RigelEngine $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/nukem2/nukem2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
