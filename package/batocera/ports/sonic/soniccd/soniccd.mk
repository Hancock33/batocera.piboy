################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Oct 07, 2023
SONICCD_VERSION = 97a2c60381de9e18467d351e9f12fb00f75732b5
SONICCD_SITE = https://github.com/Rubberduckycooly/Sonic-CD-11-Decompilation.git
SONICCD_SITE_METHOD = git
SONICCD_GIT_SUBMODULES = YES
SONICCD_SUPPORTS_IN_SOURCE_BUILD = NO

SONICCD_DEPENDENCIES = sdl2 libogg libvorbis libtheora
SONICCD_LICENSE = Custom

SONICCD_CONF_OPTS += -DRETRO_SDL_VERSION=2

define SONICCD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv3 $(TARGET_DIR)/usr/bin/soniccd
endef

$(eval $(cmake-package))
