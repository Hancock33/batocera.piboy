################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on Jul 19, 2025
SONICMANIA_VERSION = 8795c5af1ec925152b383bd8ddb68e49a52b15ae
SONICMANIA_SITE = https://github.com/RSDKModding/Sonic-Mania-Decompilation
SONICMANIA_SITE_METHOD = git
SONICMANIA_GIT_SUBMODULES = YES
SONICMANIA_SUPPORTS_IN_SOURCE_BUILD = NO
SONICMANIA_LICENSE = Custom

SONICMANIA_DEPENDENCIES += libogg libtheora portaudio sdl2

SONICMANIA_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SONICMANIA_CONF_OPTS += -DGAME_STATIC=ON
SONICMANIA_CONF_OPTS += -DGAME_INCLUDE_EDITOR=OFF
SONICMANIA_CONF_OPTS += -DRETRO_OUTPUT_NAME=sonicmania
SONICMANIA_CONF_OPTS += -DRETRO_SUBSYSTEM=SDL2

define SONICMANIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/dependencies/RSDKv5/sonicmania $(TARGET_DIR)/usr/bin/sonicmania
endef

$(eval $(cmake-package))
