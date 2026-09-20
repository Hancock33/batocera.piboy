################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on May 12, 2026
SONICMANIA_VERSION = 9dc699428420d752af9767bdb13f585ee0881bc0
SONICMANIA_SITE = https://github.com/RSDKModding/Sonic-Mania-Decompilation
SONICMANIA_SITE_METHOD = git
SONICMANIA_GIT_SUBMODULES = YES
SONICMANIA_SUPPORTS_IN_SOURCE_BUILD = NO
SONICMANIA_LICENSE = Custom
SONICMANIA_EMULATOR_INFO = sonicmania.emulator.yml
SONICMANIA_DEPENDENCIES += libogg libtheora portaudio sdl2

SONICMANIA_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SONICMANIA_CONF_OPTS += -DGAME_STATIC=ON
SONICMANIA_CONF_OPTS += -DGAME_INCLUDE_EDITOR=OFF
SONICMANIA_CONF_OPTS += -DRETRO_OUTPUT_NAME=sonic-mania
SONICMANIA_CONF_OPTS += -DRETRO_SUBSYSTEM=SDL2

define SONICMANIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/dependencies/RSDKv5/sonic-mania $(TARGET_DIR)/usr/bin/sonic-mania
	# OpenGL shaders aren't in Data.rsdk, so ship them as a mod like upstream does
	mkdir -p $(TARGET_DIR)/usr/share/sonic-mania/mods/GLShaders/Data/Shaders/OGL
	$(INSTALL) -m 0644 $(@D)/dependencies/RSDKv5/RSDKv5/Shaders/OGL/* $(TARGET_DIR)/usr/share/sonic-mania/mods/GLShaders/Data/Shaders/OGL/
	printf "Name=GLShaders\nDescription=OGLShaders\nAuthor=Ducky\nVersion=1.0.0\nTargetVersion=-1\n" $(TARGET_DIR)/usr/share/sonic-mania/mods/GLShaders/mod.ini
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
