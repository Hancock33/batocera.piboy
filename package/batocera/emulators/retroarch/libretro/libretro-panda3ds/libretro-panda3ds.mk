################################################################################
#
# libretro-panda3ds
#
################################################################################
# Version: Commits on Mar 16, 2025
LIBRETRO_PANDA3DS_VERSION = e71cbc9bc337f43bbb5c1021ab541ac802d498ec
LIBRETRO_PANDA3DS_SITE = https://github.com/wheremyfoodat/Panda3DS.git
LIBRETRO_PANDA3DS_SITE_METHOD=git
LIBRETRO_PANDA3DS_GIT_SUBMODULES=YES
LIBRETRO_PANDA3DS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_PANDA3DS_LICENSE = GPLv3
LIBRETRO_PANDA3DS_DEPENDENCIES = fdk-aac ffmpeg fmt lua

LIBRETRO_PANDA3DS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_PANDA3DS_CONF_OPTS += -DBUILD_LIBRETRO_CORE=ON
LIBRETRO_PANDA3DS_CONF_OPTS += -DUSE_LIBRETRO_AUDIO=ON
LIBRETRO_PANDA3DS_CONF_OPTS += -DENABLE_DISCORD_RPC=OFF
LIBRETRO_PANDA3DS_CONF_OPTS += -DENABLE_LUAJIT=OFF
LIBRETRO_PANDA3DS_CONF_OPTS += -DENABLE_USER_BUILD=ON

define LIBRETRO_PANDA3DS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/panda3ds_libretro.so $(TARGET_DIR)/usr/lib/libretro/panda3ds_libretro.so
endef

$(eval $(cmake-package))
