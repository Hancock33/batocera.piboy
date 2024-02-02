################################################################################
#
# citra
#
################################################################################
# Version: Commits on Feb 01, 2024
CITRA_VERSION = 8e2415f45503e67910945301feafda361b4cc63f
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
CITRA_CONF_OPTS += -DENABLE_WEB_SERVICE=ON
CITRA_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
CITRA_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
CITRA_CONF_OPTS += -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON
CITRA_CONF_OPTS += -DALSOFT_UPDATE_BUILD_VERSION=OFF
CITRA_CONF_OPTS += -DENABLE_LTO=OFF
CITRA_CONF_OPTS += -DCITRA_WARNINGS_AS_ERRORS=OFF
CITRA_CONF_OPTS += -DCITRA_ENABLE_BUNDLE_TARGET=OFF

# future support for arm using SDL2 gui?
ifeq ($(BR2_PACKAGE_QT6),y)
    CITRA_DEPENDENCIES += qt6base qt6tools qt6multimedia
    CITRA_CONF_OPTS += -DENABLE_QT=ON
    CITRA_CONF_OPTS += -DENABLE_QT_TRANSLATION=ON
    CITRA_CONF_OPTS += -DENABLE_QT_UPDATER=OFF
    CITRA_BIN = citra-qt
else
    CITRA_CONF_OPTS += -DENABLE_QT=OFF
    CITRA_CONF_OPTS += -DENABLE_SDL2_FRONTEND=ON
    CITRA_BIN = citra
endif

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

define NO_DL_EXTERNAL
	sed -i '/(DownloadExternals)/d' $(@D)/CMakeLists.txt
endef

CITRA_POST_INSTALL_TARGET_HOOKS = CITRA_EVMAP
CITRA_PRE_CONFIGURE_HOOKS += NO_DL_EXTERNAL

$(eval $(cmake-package))
