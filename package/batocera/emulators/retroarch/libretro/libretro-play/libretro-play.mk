################################################################################
#
# libretro-play
#
################################################################################
# Version: Commits on Apr 18, 2023
LIBRETRO_PLAY_VERSION = 7f596213cde623d5d9ce3298bd2148e0d8702afb
LIBRETRO_PLAY_SOURCE = play-$(LIBRETRO_PLAY_VERSION)-br1.tar.gz
LIBRETRO_PLAY_SITE = https://github.com/jpd002/Play-.git
LIBRETRO_PLAY_LICENSE = BSD
LIBRETRO_PLAY_DEPENDENCIES = libglew

LIBRETRO_PLAY_SITE_METHOD = git
LIBRETRO_PLAY_GIT_SUBMODULES = YES

LIBRETRO_PLAY_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_TESTS=OFF
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_LIBRETRO_CORE=ON
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_PLAY=OFF
LIBRETRO_PLAY_CONF_OPTS += -DENABLE_AMAZON_S3=ON
# Force to use GLES on ARM
#LIBRETRO_PLAY_CONF_OPTS += -DUSE_GLEW=OFF
#LIBRETRO_PLAY_CONF_OPTS += -DUSE_GLES=ON

define LIBRETRO_PLAY_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/Source/ui_libretro/play_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/play_libretro.so
endef

$(eval $(cmake-package))
