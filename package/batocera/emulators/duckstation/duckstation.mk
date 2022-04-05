################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on Apr 04, 2022
DUCKSTATION_VERSION = 1d9075fa1c53b58e493178f39afc770d1bc8fd59
DUCKSTATION_SITE = https://github.com/stenzek/duckstation.git
DUCKSTATION_SITE_METHOD=git
DUCKSTATION_GIT_SUBMODULES=YES
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_DEPENDENCIES = fmt boost ffmpeg
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

DUCKSTATION_CONF_ENV += LDFLAGS=-lpthread

DUCKSTATION_CONF_OPTS  =  -DANDROID=OFF \
	                      -DBUILD_LIBRETRO_CORE=OFF \
	                      -DENABLE_DISCORD_PRESENCE=OFF \
	                      -DBUILD_GO2_FRONTEND=OFF \
	                      -DBUILD_QT_FRONTEND=OFF \
	                      -DBUILD_NOGUI_FRONTEND=ON \
	                      -DCMAKE_BUILD_TYPE=Release \
	                      -DBUILD_SHARED_LIBS=OFF \
	                      -DUSE_SDL2=ON \
	                      -DENABLE_CHEEVOS=ON \
	                      -DHAVE_EGL=ON \
	                      -DUSE_DRMKMS=ON \
	                      -DUSE_FBDEV=OFF \
	                      -DUSE_MALI=OFF

ifeq ($(BR2_PACKAGE_XORG7),y)
  DUCKSTATION_CONF_OPTS += -DUSE_X11=ON
else
  DUCKSTATION_CONF_OPTS += -DUSE_X11=OFF
endif

define DUCKSTATION_INSTALL_TARGET_CMDS
  mkdir -p $(TARGET_DIR)/usr/bin
  mkdir -p $(TARGET_DIR)/usr/lib
  mkdir -p $(TARGET_DIR)/usr/share/duckstation

  $(INSTALL) -D $(@D)/buildroot-build/bin/duckstation* $(TARGET_DIR)/usr/bin/
  cp -R $(@D)/buildroot-build/bin/database      $(TARGET_DIR)/usr/share/duckstation/
  rm -f $(TARGET_DIR)/usr/share/duckstation/database/gamecontrollerdb.txt
  cp -R $(@D)/buildroot-build/bin/inputprofiles $(TARGET_DIR)/usr/share/duckstation/
  cp -R $(@D)/buildroot-build/bin/resources     $(TARGET_DIR)/usr/share/duckstation/
  cp -R $(@D)/buildroot-build/bin/shaders       $(TARGET_DIR)/usr/share/duckstation/

  mkdir -p $(TARGET_DIR)/usr/share/evmapy
  cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/duckstation/psx.duckstation.keys $(TARGET_DIR)/usr/share/evmapy
endef

define DUCKSTATION_TRANSLATIONS
  mkdir -p $(TARGET_DIR)/usr/share/duckstation
  cp -R $(@D)/buildroot-build/bin/translations  $(TARGET_DIR)/usr/share/duckstation/
endef

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64),y)
  DUCKSTATION_POST_INSTALL_TARGET_HOOKS += DUCKSTATION_TRANSLATIONS
endif

$(eval $(cmake-package))
