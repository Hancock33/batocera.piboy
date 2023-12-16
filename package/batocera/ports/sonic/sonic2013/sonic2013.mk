################################################################################
#
# sonic2013
#
################################################################################
# Version: Commits on Dec 01, 2023
SONIC2013_VERSION = 72de771fc7ca2f24d9634f10bea7cb7e37287b76
SONIC2013_SITE = https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation.git
SONIC2013_SITE_METHOD = git
SONIC2013_GIT_SUBMODULES = YES
SONIC2013_SUPPORTS_IN_SOURCE_BUILD = NO
SONIC2013_LICENSE = Custom

SONIC2013_DEPENDENCIES = sdl2 libogg libvorbis

# legacy version for systems that don't support libglew
ifneq ($(BR2_PACKAGE_LIBGLEW),y)
    SONIC2013_VERSION = f9718af
else
    SONIC2013_DEPENDENCIES += libglew
endif

SONIC2013_CONF_OPTS += -DRETRO_SDL_VERSION=2

define SONIC2013_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv4 $(TARGET_DIR)/usr/bin/sonic2013
endef

$(eval $(cmake-package))
