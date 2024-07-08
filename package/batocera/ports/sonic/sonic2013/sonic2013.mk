################################################################################
#
# sonic2013
#
################################################################################
# Version: Commits on Jul 07, 2024
SONIC2013_VERSION = 3258aa384d933f501fbdc3cbc05f695e62426c79
SONIC2013_SITE = https://github.com/RSDKModding/RSDKv4-Decompilation.git
SONIC2013_SITE_METHOD = git
SONIC2013_GIT_SUBMODULES = YES
SONIC2013_SUPPORTS_IN_SOURCE_BUILD = NO
SONIC2013_LICENSE = Custom

SONIC2013_DEPENDENCIES = sdl2 libogg libvorbis libglew

SONIC2013_CONF_OPTS += -DRETRO_SDL_VERSION=2

define SONIC2013_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv4 $(TARGET_DIR)/usr/bin/sonic2013
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/sonic2013/sonicretro.sonic2013.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
