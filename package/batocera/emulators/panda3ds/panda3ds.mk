################################################################################
#
# panda3ds
#
################################################################################
# Version: Commits on Jul 16, 2024
PANDA3DS_VERSION = 6bef278f43716e7d2219a46d3646adbb2868edff
PANDA3DS_SITE = https://github.com/wheremyfoodat/Panda3DS.git

PANDA3DS_SITE_METHOD=git
PANDA3DS_GIT_SUBMODULES=YES
PANDA3DS_LICENSE = GPLv2
PANDA3DS_DEPENDENCIES += boost catch2 cubeb fdk-aac ffmpeg fmt libbacktrace qt6base qt6multimedia sdl2
PANDA3DS_SUPPORTS_IN_SOURCE_BUILD = NO

ifeq ($(BR2_PACKAGE_QT6),y)
#	PANDA3DS_DEPENDENCIES += qt6base qt6tools qt6multimedia
#	PANDA3DS_CONF_OPTS += -DENABLE_QT_GUI=ON
endif

PANDA3DS_CONF_ENV += LDFLAGS=-lpthread
PANDA3DS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define PANDA3DS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D $(@D)/buildroot-build/Alber $(TARGET_DIR)/usr/bin/panda3ds
endef

define PANDA3DS_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/panda3ds/3ds.panda3ds.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

PANDA3DS_POST_INSTALL_TARGET_HOOKS = PANDA3DS_EVMAP

$(eval $(cmake-package))
