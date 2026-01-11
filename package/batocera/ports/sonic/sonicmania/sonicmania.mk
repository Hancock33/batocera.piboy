################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on Jan 07, 2026
SONICMANIA_VERSION = f1b8e84e9d464c52716e6973554e52bb6302de40
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
