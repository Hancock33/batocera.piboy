################################################################################
#
# lemonade
#
################################################################################
# Version: Commits on Apr 03, 2024
LEMONADE_VERSION = f580ff64a5a34f94a63b60732b1a92f3ee6df88b
LEMONADE_SITE = https://github.com/Lemonade-emu/Lemonade.git
LEMONADE_SITE_METHOD=git
LEMONADE_GIT_SUBMODULES=YES
LEMONADE_LICENSE = GPLv2
LEMONADE_DEPENDENCIES += boost catch2 cubeb fdk-aac ffmpeg fmt libbacktrace qt6base qt6multimedia qt6tools sdl2
LEMONADE_SUPPORTS_IN_SOURCE_BUILD = NO

LEMONADE_CONF_OPTS += -DALSOFT_UPDATE_BUILD_VERSION=OFF
LEMONADE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LEMONADE_CONF_OPTS += -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON
LEMONADE_CONF_OPTS += -DENABLE_LTO=OFF
LEMONADE_CONF_OPTS += -DENABLE_SDL2=ON
LEMONADE_CONF_OPTS += -DENABLE_WEB_SERVICE=ON
LEMONADE_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
LEMONADE_CONF_OPTS += -DUSE_SYSTEM_LIBS=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_CPP_HTTPLIB=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_CPP_JWT=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_CRYPTOPP=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_DYNARMIC=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_INIH=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_LODEPNG=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_VMA=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_XBYAK=ON
LEMONADE_CONF_OPTS += -DDISABLE_SYSTEM_ZSTD=ON
LEMONADE_CONF_OPTS += -DLEMONADE_WARNINGS_AS_ERRORS=OFF
LEMONADE_CONF_OPTS += -DLEMONADE_ENABLE_BUNDLE_TARGET=OFF

LEMONADE_CONF_ENV += LDFLAGS=-lpthread

define LEMONADE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/lib
	$(INSTALL) -D $(@D)/buildroot-build/bin/Release/lemonade-qt $(TARGET_DIR)/usr/bin/lemonade-qt
endef

define LEMONADE_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/lemonade/3ds.lemonade.keys $(TARGET_DIR)/usr/share/evmapy
endef

define NO_DL_EXTERNAL
	sed -i '/(DownloadExternals)/d' $(@D)/CMakeLists.txt
endef

LEMONADE_POST_INSTALL_TARGET_HOOKS = LEMONADE_EVMAP
LEMONADE_PRE_CONFIGURE_HOOKS += NO_DL_EXTERNAL

$(eval $(cmake-package))
