################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Aug 21, 2024
SONICCD_VERSION = a08c065fbe7c5a93c1f4e7b92df033e7f31ab7d7
SONICCD_SITE = https://github.com/RSDKModding/RSDKv3-Decompilation.git
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
