################################################################################
#
# sonic2013
#
################################################################################
# Version: Commits on Oct 29, 2023
SONIC2013_VERSION = fc08172ce209db2059cbe4a287dca32e5f8bd701
SONIC2013_SITE = https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation.git
SONIC2013_SITE_METHOD = git
SONIC2013_GIT_SUBMODULES = YES
SONIC2013_SUPPORTS_IN_SOURCE_BUILD = NO

SONIC2013_DEPENDENCIES = sdl2 libogg libvorbis
SONIC2013_LICENSE = Custom

SONIC2013_CONF_OPTS += -DRETRO_SDL_VERSION=2

define SONIC2013_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv4 $(TARGET_DIR)/usr/bin/sonic2013
endef

$(eval $(cmake-package))
