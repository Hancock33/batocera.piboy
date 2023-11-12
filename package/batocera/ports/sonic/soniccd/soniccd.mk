################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Nov 12, 2023
SONICCD_VERSION = aea302ed5dc4a5bf82bad04594c51e9be3ed6f59
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
