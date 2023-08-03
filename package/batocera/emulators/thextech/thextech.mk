################################################################################
#
# TheXTech
#
################################################################################
# Version: Commits on Aug 03, 2023
THEXTECH_VERSION = c901a84b1380ac80cf8572d7a9a628c732481106
THEXTECH_SITE = https://github.com/Wohlstand/TheXTech
THEXTECH_SITE_METHOD = git
THEXTECH_GIT_SUBMODULES = YES
THEXTECH_LICENSE = GPLv3
THEXTECH_DEPENDENCIES = sdl2 sdl2_mixer sdl2_ttf host-ninja

THEXTECH_CONF_ENV = GIT_DISCOVERY_ACROSS_FILESYSTEM=1
THEXTECH_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
THEXTECH_CONF_OPTS += -DTHEXTECH_ENABLE_TTF_SUPPORT=ON
THEXTECH_CONF_OPTS += -DUSE_SYSTEM_LIBS_DEFAULT=ON
THEXTECH_CONF_OPTS += -DUSE_SYSTEM_SDL2=ON

define THEXTECH_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(THEXTECH_BUILDDIR)
endef

define THEXTECH_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/output/bin/thextech $(TARGET_DIR)/usr/bin/
	cp -avf $(@D)/output/lib/libSDL2_mixer_ext.so* $(TARGET_DIR)/usr/lib/
	cp -avf $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/thextech/thextech.keys $(TARGET_DIR)/usr/share/evmapy/
endef

$(eval $(cmake-package))
