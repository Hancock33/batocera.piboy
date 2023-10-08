################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on Sept 27, 2023
SONICMANIA_VERSION = ea041235681793298fcf0582f770b143fbef872d
SONICMANIA_SITE = https://github.com/Rubberduckycooly/Sonic-Mania-Decompilation.git
SONICMANIA_SITE_METHOD = git
SONICMANIA_GIT_SUBMODULES = YES
SONICMANIA_SUPPORTS_IN_SOURCE_BUILD = NO

SONICMANIA_DEPENDENCIES = sdl2 libogg libvorbis
SONICMANIA_LICENSE = Custom

SONICMANIA_CONF_OPTS += -DRETRO_SDL_VERSION=2
SONICMANIA_CONF_OPTS += -DGAME_STATIC=ON

define SONICMANIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/dependencies/RSDKv5/RSDKv5U $(TARGET_DIR)/usr/bin/sonicmania
endef

$(eval $(cmake-package))