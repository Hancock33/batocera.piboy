################################################################################
#
# citra
#
################################################################################
# Version: Commits on Apr 15, 2023 (branch@qt6)
CITRA_VERSION = ab560405b86c038204d0fb5650025dcbbf1087ee
CITRA_SITE = https://github.com/Steveice10/citra.git
CITRA_SITE_METHOD=git
CITRA_GIT_SUBMODULES=YES
CITRA_LICENSE = GPLv2
CITRA_DEPENDENCIES += fmt boost ffmpeg sdl2 fdk-aac qt6base qt6multimedia
CITRA_SUPPORTS_IN_SOURCE_BUILD = NO

CITRA_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
CITRA_CONF_OPTS += -DENABLE_SDL2=ON
CITRA_CONF_OPTS += -DENABLE_QT=ON
CITRA_CONF_OPTS += -DENABLE_WEB_SERVICE=OFF
CITRA_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
CITRA_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
CITRA_CONF_OPTS += -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON
CITRA_CONF_OPTS += -DENABLE_FFMPEG_VIDEO_DUMPER=ON
CITRA_CONF_OPTS += -DENABLE_FFMPEG_AUDIO_DECODER=ON

CITRA_CONF_ENV += LDFLAGS=-lpthread

define CITRA_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/bin
    mkdir -p $(TARGET_DIR)/usr/lib
	$(INSTALL) -D $(@D)/buildroot-build/bin/Release/citra \
		$(TARGET_DIR)/usr/bin/citra-qt
endef

define CITRA_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/citra/3ds.citra.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

CITRA_POST_INSTALL_TARGET_HOOKS = CITRA_EVMAP

$(eval $(cmake-package))
