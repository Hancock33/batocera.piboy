################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Mar 21, 2024
SONICCD_VERSION = bf8e3a1c237a76ef58d5353a473e0f01dd650303
SONICCD_SITE = https://github.com/Rubberduckycooly/Sonic-CD-11-Decompilation.git
SONICCD_SITE_METHOD = git
SONICCD_GIT_SUBMODULES = YES
SONICCD_SUPPORTS_IN_SOURCE_BUILD = NO
SONICCD_LICENSE = Custom

SONICCD_DEPENDENCIES = sdl2 libogg libvorbis libtheora libglew

SONICCD_CONF_OPTS += -DRETRO_SDL_VERSION=2

define SONICCD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv3 $(TARGET_DIR)/usr/bin/soniccd
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/soniccd/sonicretro.soniccd.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
