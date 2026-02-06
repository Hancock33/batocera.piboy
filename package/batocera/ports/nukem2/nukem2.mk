################################################################################
#
# nukem2
#
################################################################################
# Version: Commits on May 26, 2024
NUKEM2_VERSION = f05996f9b3ad3b3ea5bb818e49e7977636746343
NUKEM2_SITE = https://github.com/lethal-guitar/RigelEngine.git
NUKEM2_SITE_METHOD=git
NUKEM2_GIT_SUBMODULES=YES
NUKEM2_EMULATOR_INFO = nukem2.emulator.yml
NUKEM2_DEPENDENCIES = sdl2 sdl2_mixer
NUKEM2_LICENSE = GPL-2.0
NUKEM2_SUPPORTS_IN_SOURCE_BUILD = NO

NUKEM2_CONF_OPTS += -DUSE_GL_ES=ON
NUKEM2_CONF_OPTS += -DWARNINGS_AS_ERRORS=OFF

define NUKEM2_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/src/RigelEngine $(TARGET_DIR)/usr/bin
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
