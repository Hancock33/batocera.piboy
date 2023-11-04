################################################################################
#
# citra
#
################################################################################
# Version: Commits on Nov 04, 2023
CITRA_VERSION = 1570aeffcbd388308fd192a7e64fe9fa4b40f248
CITRA_SITE = https://github.com/citra-emu/citra.git

CITRA_SITE_METHOD=git
CITRA_GIT_SUBMODULES=YES
CITRA_LICENSE = GPLv2
CITRA_DEPENDENCIES += boost fdk-aac ffmpeg fmt libbacktrace qt6base qt6multimedia sdl2
CITRA_SUPPORTS_IN_SOURCE_BUILD = NO

CITRA_CONF_OPTS += -DENABLE_SDL2=ON
CITRA_CONF_OPTS += -DUSE_SYSTEM_SDL2=ON
CITRA_CONF_OPTS += -DUSE_SYSTEM_BOOST=ON
CITRA_CONF_OPTS += -DUSE_SYSTEM_OPENSSL=ON
CITRA_CONF_OPTS += -DUSE_SYSTEM_LIBUSB=ON
CITRA_CONF_OPTS += -DUSE_SYSTEM_FMT=ON
CITRA_CONF_OPTS += -DENABLE_QT=ON
CITRA_CONF_OPTS += -DENABLE_WEB_SERVICE=ON
CITRA_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
CITRA_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
CITRA_CONF_OPTS += -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON
CITRA_CONF_OPTS += -DALSOFT_UPDATE_BUILD_VERSION=OFF
CITRA_CONF_OPTS += -DENABLE_LTO=ON
CITRA_CONF_OPTS += -DCITRA_WARNINGS_AS_ERRORS=OFF

CITRA_CONF_ENV += LDFLAGS=-lpthread

define CITRA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/lib
	$(INSTALL) -D $(@D)/buildroot-build/bin/Release/citra-qt \
		$(TARGET_DIR)/usr/bin/citra-qt
endef

define CITRA_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/citra/3ds.citra.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

CITRA_POST_INSTALL_TARGET_HOOKS = CITRA_EVMAP

$(eval $(cmake-package))
