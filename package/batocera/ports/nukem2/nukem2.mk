################################################################################
#
# nukem2
#
################################################################################
# Version: Commits on Sept 28, 2026
NUKEM2_VERSION = 30afeff8f0b105eac77ee0a2fbd54b06e1a49b60
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
