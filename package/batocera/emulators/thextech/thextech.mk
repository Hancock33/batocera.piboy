################################################################################
#
# thextech
#
################################################################################
# Version: Commits on Aug 30, 2023
THEXTECH_VERSION = 497ccee4baab5b1cc45ce24196bfa8635097b541
THEXTECH_SITE = https://github.com/Wohlstand/TheXTech
THEXTECH_SITE_METHOD = git
THEXTECH_GIT_SUBMODULES = YES
THEXTECH_LICENSE = GPLv3
THEXTECH_DEPENDENCIES = sdl2 sdl2_mixer sdl2_ttf

THEXTECH_CONF_ENV = GIT_DISCOVERY_ACROSS_FILESYSTEM=1
THEXTECH_CONF_OPTS += -DTHEXTECH_ENABLE_TTF_SUPPORT=ON
THEXTECH_CONF_OPTS += -DUSE_SYSTEM_LIBS_DEFAULT=ON
THEXTECH_CONF_OPTS += -DUSE_SYSTEM_SDL2=ON

ifeq ($(BR2_PACKAGE_HAS_LIBGL),)
THEXTECH_CONF_OPTS += -DTHEXTECH_BUILD_GL_DESKTOP_MODERN=OFF -DTHEXTECH_BUILD_GL_DESKTOP_LEGACY=OFF
endif

define THEXTECH_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/output/bin/thextech $(TARGET_DIR)/usr/bin/
	cp -avf $(@D)/output/lib/libSDL2_mixer_ext.so* $(TARGET_DIR)/usr/lib/
	cp -avf $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/thextech/thextech.keys $(TARGET_DIR)/usr/share/evmapy/
endef

$(eval $(cmake-package))
