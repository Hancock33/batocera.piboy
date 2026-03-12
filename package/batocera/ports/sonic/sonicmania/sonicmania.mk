################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on Mar 12, 2026
SONICMANIA_VERSION = ca19403c95c15e6abc893999b0f3de035c3aea17
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
SONICMANIA_CONF_OPTS += -DRETRO_OUTPUT_NAME=sonicmania
SONICMANIA_CONF_OPTS += -DRETRO_SUBSYSTEM=SDL2

define SONICMANIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/dependencies/RSDKv5/sonicmania $(TARGET_DIR)/usr/bin/sonicmania
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
